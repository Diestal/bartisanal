
class Login():
    def __init__(self):
        self.usuario = "Usuario"
        self.contrasena = "Contraseña"

    def login_in(self, usuario, contrasena):
        if usuario == self.usuario and self.contrasena == contrasena:
            return True
        else:
            return False