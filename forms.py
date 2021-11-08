from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, PasswordField, RadioField, DateField, SelectField, IntegerField
# from wtforms_sqlalchemy.fields import QuerySelectField, QueryRadioField
from wtforms.validators import DataRequired, URL, InputRequired, Email
from flask_ckeditor import CKEditorField


##WTForm
class CrearProducto(FlaskForm):
    imagen = StringField("URL de Imagen de producto", validators=[DataRequired(), URL()])
    nombre = StringField("Nombre del producto", validators=[DataRequired()])
    descr_prod = CKEditorField("Descripción Producto", validators=[DataRequired()])
    categoria = RadioField(
        "Categoría",
        choices=[
            ('1','Porcelana'),
            ('2','Muñequería'),
            ('3', 'Country'),
            ('4', 'Otr@s')
        ],
        validators=[DataRequired()])
    precio = IntegerField("Precio del producto", validators=[DataRequired()])
    stock = IntegerField("Stock del producto", validators=[DataRequired()])
    submit = SubmitField("Añadir producto")


class CreatePostForm(FlaskForm):
    title = StringField("Blog Post Title", validators=[DataRequired()])
    subtitle = StringField("Subtitle", validators=[DataRequired()])
    img_url = StringField("Blog Image URL", validators=[DataRequired(), URL()])
    body = CKEditorField("Blog Content", validators=[DataRequired()])
    submit = SubmitField("Submit Post")


class RegisterForm(FlaskForm):
    name = StringField("Nombre", validators=[DataRequired()])
    last_name = StringField("Apellido", validators=[DataRequired()])
    sex = RadioField(
        "Sexo",
        choices=[
            ("M", 'Masculino'),
            ('F', 'Femenino')
        ],
        coerce=str
    )
    born_date = DateField("Fecha de Nacimiento", format='%Y-%m-%d', validators=[DataRequired()])
    number = StringField("Celular", validators=[DataRequired()])
    dpto = SelectField("Departamento", coerce=int, validators=[InputRequired()])
    city = SelectField("Ciudad", coerce=int, validators=[InputRequired()])
    address = StringField("Dirección de domicilio", validators=[DataRequired()])
    email = StringField("Email", validators=[DataRequired(), Email()])
    password = PasswordField("Contraseña", validators=[DataRequired()])
    submit = SubmitField("Registrarse")


class LoginForm(FlaskForm):
    email = StringField("Email", validators=[DataRequired()])
    password = PasswordField("Contraseña", validators=[DataRequired()])
    submit = SubmitField("Ingresar")


class CommentForm(FlaskForm):
    comment_text = CKEditorField("Comment", validators=[DataRequired()])
    submit = SubmitField("Submit Comment")
