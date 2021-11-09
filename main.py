from flask import Flask, render_template, redirect, url_for, flash, abort, request
from flask_bootstrap import Bootstrap
from flask_ckeditor import CKEditor
from datetime import date
from functools import wraps
from werkzeug.security import generate_password_hash, check_password_hash
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import relationship
from flask_login import UserMixin, login_user, LoginManager, login_required, current_user, logout_user
from forms import LoginForm, RegisterForm, CreatePostForm, CommentForm, CrearProducto
from flask_gravatar import Gravatar

from login import Login

app = Flask(__name__)
app.config['SECRET_KEY'] = '8BYkEfBA6O6donzWlSihBXox7C0sKR6b'
ckeditor = CKEditor(app)
Bootstrap(app)
gravatar = Gravatar(app, size=100, rating='g', default='retro', force_default=False, force_lower=False, use_ssl=False, base_url=None)
app._static_folder = 'static/'

## Conexión a la base de datos
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///bartisanal.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
login_manager = LoginManager()
login_manager.init_app(app)


@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))


## Configuración de las tablas
class TipoUser(db.Model):
    __tablename__ = "tipo_users"
    id = db.Column(db.Integer, primary_key=True)
    nombre_tipo = db.Column(db.String(100), unique=True)

    users = relationship("User", back_populates="tipo_usuarios")


class Departamento(db.Model):
    __tablename__ = "departamentos"
    id = db.Column(db.Integer, primary_key=True)
    nombre_depto = db.Column(db.String(100))

    ciudades = relationship("Ciudad", back_populates="departamentos")
    users = relationship("User", back_populates="departamentos")


class Ciudad(db.Model):
    __tablename__ = "ciudades"
    id = db.Column(db.Integer, primary_key=True)
    id_depto = db.Column(db.Integer, db.ForeignKey("departamentos.id"))
    nombre_ciudad = db.Column(db.String(100))

    departamentos = relationship("Departamento", back_populates="ciudades")
    users = relationship("User", back_populates="ciudades")


class User(UserMixin, db.Model):
    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key=True)
    tipo_id = db.Column(db.Integer, db.ForeignKey("tipo_users.id"))
    depto_id = db.Column(db.Integer, db.ForeignKey("departamentos.id"))
    ciudad_id = db.Column(db.Integer, db.ForeignKey("ciudades.id"))
    email = db.Column(db.String(100), unique=True)
    contrasena = db.Column(db.String(100))
    nombre = db.Column(db.String(100))
    apellido = db.Column(db.String(100))
    sexo = db.Column(db.String(1))
    numero = db.Column(db.String(100), unique=True)
    fecha_nacimiento = db.Column(db.Date, index=True)
    direccion = db.Column(db.String(100))

    resenas = relationship("Resena", back_populates="resena_autor")
    tipo_usuarios = relationship("TipoUser", back_populates="users")
    departamentos = relationship("Departamento", back_populates="users")
    ciudades = relationship("Ciudad", back_populates="users")


class Producto(db.Model):
    __tablename__ = "productos"
    id = db.Column(db.Integer, primary_key=True)
    imagen = db.Column(db.String(250), nullable=False)
    nombre_producto = db.Column(db.String(100), unique=True)
    descr_producto = db.Column(db.Text, nullable=False)
    categoria = db.Column(db.String(100), nullable=False)
    precio = db.Column(db.Integer, nullable=False)
    fecha_creacion = db.Column(db.Date, index=True)
    stock = db.Column(db.Integer)

    resenas = relationship("Resena", back_populates="productos")


class Resena(db.Model):
    __tablename__ = "resenas"
    id = db.Column(db.Integer, primary_key=True)
    producto_id = db.Column(db.Integer, db.ForeignKey("productos.id"))
    author_id = db.Column(db.Integer, db.ForeignKey("users.id"))
    calificacion = db.Column(db.Integer, nullable=False)
    texto_resena = db.Column(db.Text, nullable=False)

    productos = relationship("Producto", back_populates="resenas")
    resena_autor = relationship("User", back_populates="resenas")
    text = db.Column(db.Text, nullable=False)


db.create_all()


def admin_only(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if current_user.tipo_id == 1:
            return abort(403)
        return f(*args, **kwargs)
    return decorated_function


@app.route("/")
def home():
    productos = db.session.query(Producto).all()

    return render_template("index.html", productos=productos, current_user=current_user)


@app.route("/register", methods=['POST', 'GET'])
def register():
    form = RegisterForm()

    deptos = db.session.query(Departamento).all()
    deptos_list = [(d.id, d.nombre_depto) for d in deptos]
    form.dpto.choices = deptos_list

    value = form.dpto.data
    chosen_depto_id = db.session.query(Departamento).filter(Departamento.id == 1)
    print(value)

    cities = db.session.query(Ciudad).filter(Ciudad.id_depto == 1).all()
    cities_list = [(d.id, d.nombre_ciudad) for d in cities]
    form.city.choices = cities_list
    chosen_city = Ciudad.query.filter_by(nombre_ciudad=form.city.data).first()

    if form.validate_on_submit():

        if User.query.filter_by(email=form.email.data).first():
            print(User.query.filter_by(email=form.email.data).first())
            #User already exists
            flash("¡Ya te has registrado con ese email, más bien inicia sesión!")
            return redirect(url_for('login'))

        hash_and_salted_password = generate_password_hash(
            form.password.data,
            method='pbkdf2:sha256',
            salt_length=8
        )
        new_user = User(
            tipo_id=1,
            depto_id=1,
            ciudad_id=1,
            email=form.email.data,
            contrasena=hash_and_salted_password,
            nombre=form.name.data,
            apellido=form.last_name.data,
            sexo=form.sex.data,
            numero=form.number.data,
            fecha_nacimiento=form.born_date.data,
            direccion=form.address.data
        )
        db.session.add(new_user)
        db.session.commit()
        login_user(new_user)
        # return redirect(url_for("get_all_posts"))
    return render_template("register.html", form=form, current_user=current_user)


@app.route('/login', methods=["GET", "POST"])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        email = form.email.data
        password = form.password.data

        user = User.query.filter_by(email=email).first()
        # Email doesn't exist or password incorrect.
        if not user:
            flash("Ese email no existe, por favor inténtelo de nuevo.")
            return redirect(url_for('login'))
        elif not check_password_hash(user.contrasena, password):
            flash('Contraseña incorrecta, por favor inténtelo de nuevo.')
            return redirect(url_for('login'))
        else:
            login_user(user)
            return redirect(url_for('home'))
    return render_template("login_1.html", form=form, current_user=current_user)


@app.route("/producto/<int:prod_id>", methods=["GET", "POST"])
def show_prod(prod_id):
    form = CommentForm()
    requested_prod = db.session.query(Producto).get(prod_id)

    if form.validate_on_submit():
        if not current_user.is_authenticated:
            flash("Tienes que iniciar sesión para dejar una reseña o usar el carrito de compras.")
            return redirect(url_for("login"))

        new_comment = Resena(
            text=form.comment_text.data,
            comment_author=current_user,
            parent_post=requested_prod
        )
        db.session.add(new_comment)
        db.session.commit()

    return render_template("producto.html", prod=requested_prod, form=form, current_user=current_user)



@app.route("/nuevo-producto", methods=['POST', 'GET'])
@admin_only
def nuevo_producto():
    form = CrearProducto()
    if form.validate_on_submit():
        new_prod = Producto(
            imagen=form.imagen.data,
            nombre_producto=form.nombre.data,
            descr_producto=form.descr_prod.data,
            categoria=form.categoria.data,
            precio=form.precio.data,
            fecha_creacion=date.today(),
            stock=form.stock.data
        )
        db.session.add(new_prod)
        db.session.commit()
        return redirect(url_for("home"))

    return render_template("nuevo_prod.html", form=form, current_user=current_user)


@app.route("/editar-prod/<int:prod_id>", methods=["GET", "POST"])
@admin_only
def editar_prod(prod_id):
    prod = Producto.query.get(prod_id)
    edit_prod = CrearProducto(
        imagen=prod.imagen,
        nombre=prod.nombre_producto,
        descr_prod=prod.descr_producto,
        precio=prod.precio,
        stock=prod.stock
    )
    if edit_prod.validate_on_submit():
        prod.imagen = edit_prod.imagen.data
        prod.nombre_producto = edit_prod.nombre.data
        prod.descr_producto = edit_prod.descr_prod.data
        prod.categoria = edit_prod.categoria.data
        prod.precio = edit_prod.precio.data
        prod.stock = edit_prod.stock.data

        db.session.add(prod)
        db.session.commit()
        print(prod.categoria)
        return redirect(url_for("show_prod", prod_id=prod.id))

    return render_template("nuevo_prod.html", form=edit_prod, is_edit=True, current_user=current_user)


@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('home'))





if __name__ == "__main__":
    app.run(debug=True)