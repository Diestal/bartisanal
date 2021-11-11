from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, PasswordField, RadioField, DateField, SelectField, IntegerField
# from wtforms_sqlalchemy.fields import QuerySelectField, QueryRadioField
from wtforms.validators import DataRequired, URL, InputRequired, Email, NumberRange
from flask_ckeditor import CKEditorField


##WTForm
class CrearProducto(FlaskForm):
    imagen = StringField("URL de Imagen de producto", validators=[DataRequired(message="Por favor ingresar datos en todos los campos."), URL()])
    nombre = StringField("Nombre del producto", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    descr_prod = CKEditorField("Descripción Producto", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    categoria = RadioField(
        "Categoría",
        choices=[
            ('1','Porcelana'),
            ('2','Muñequería'),
            ('3', 'Country'),
            ('4', 'Otr@s')
        ],
        validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    precio = IntegerField("Precio del producto", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    stock = IntegerField("Stock del producto", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    submit = SubmitField("Añadir producto")


class CreatePostForm(FlaskForm):
    title = StringField("Blog Post Title", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    subtitle = StringField("Subtitle", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    img_url = StringField("Blog Image URL", validators=[DataRequired(message="Por favor ingresar datos en todos los campos."), URL()])
    body = CKEditorField("Blog Content", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    submit = SubmitField("Submit Post")


class RegisterForm(FlaskForm):
    name = StringField("Nombre", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    last_name = StringField("Apellido", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    sex = RadioField(
        "Sexo",
        choices=[
            ("M", 'Masculino'),
            ('F', 'Femenino')
        ],
        coerce=str
    )
    born_date = DateField("Fecha de Nacimiento", format='%Y-%m-%d', validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    number = StringField("Celular", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    dpto = StringField("Departamento", validators=[InputRequired(message="Por favor ingresar datos en todos los campos.")])
    city = StringField("Ciudad", validators=[InputRequired(message="Por favor ingresar datos en todos los campos.")])
    address = StringField("Dirección de domicilio", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    email = StringField("Email", validators=[DataRequired(message="Por favor ingresar datos en todos los campos."), Email()])
    password = PasswordField("Contraseña", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    submit = SubmitField("Registrarse")

class RegisterUserForm(FlaskForm):
    name = StringField("Nombre", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    last_name = StringField("Apellido", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    sex = RadioField(
        "Sexo",
        choices=[
            ("M", 'Masculino'),
            ('F', 'Femenino')
        ],
        coerce=str
    )
    born_date = DateField("Fecha de Nacimiento", format='%Y-%m-%d', validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    number = StringField("Celular", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    dpto = StringField("Departamento", validators=[InputRequired(message="Por favor ingresar datos en todos los campos.")])
    city = StringField("Ciudad", validators=[InputRequired(message="Por favor ingresar datos en todos los campos.")])
    address = StringField("Dirección de domicilio", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    email = StringField("Email", validators=[DataRequired(message="Por favor ingresar datos en todos los campos."), Email()])
    password = PasswordField("Contraseña", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    tipo_usuario = RadioField(
        "Tipo de usuario",
        choices=[
            (1, 'Usuario'),
            (2, 'Administrador'),
            (3, 'Empleado')
        ],
        coerce=int
    )
    submit = SubmitField("Resgistrar usuario")

class LoginForm(FlaskForm):
    email = StringField("Email", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    password = PasswordField("Contraseña", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    submit = SubmitField("Ingresar")


class CambiarContrasena(FlaskForm):
    email = StringField("Ingrese correo con el que se registró", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    new_password = PasswordField("Ingrese su nueva contraseña", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    submit = SubmitField("Cambiar contraseña")


class CommentForm(FlaskForm):
    calificacion = IntegerField("Califique el producto de 1 a 5 (sólo ingresar números)",
                                validators=[DataRequired(message="Por favor ingresar datos en todos los campos."), NumberRange(min=1, max=5, message="Sólo se permiten valores entre el 1 y el 5.")])
    comment_text = CKEditorField("Comment", validators=[DataRequired(message="Por favor ingresar datos en todos los campos.")])
    submit = SubmitField("Submit Comment")
