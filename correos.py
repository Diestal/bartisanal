import smtplib
from datetime import date, time

MY_EMAIL = "bartisanarstore@gmail.com"
MY_PASSWORD = "Bartisanar10"
cambio_contrasena = "Buen tiempo, querido usuario. Se notifica que hizo cambio de contraseña a las" \
                    "{time} del día {date.today()}." \
                    "Su nueva contraseña es {contrasena}." \
                    "Si usted no ha sido el responsable del cambio de la contraseña, por favor remitir" \
                    "su queja por este mismo medio y correo."

def enviar_correo_cambio_contrasena(email, contrasena):
    cambio_contrasena = f"Buen tiempo, querido usuario. Se notifica que hizo cambio de contraseña a las" \
                        f"{time.hour} del día {date.today()}." \
                        f"Su nueva contraseña es {contrasena}." \
                        f"Si usted no ha sido el responsable del cambio de la contraseña, por favor remitir" \
                        f"su queja por este mismo medio y correo."
    mail = f"Subject: Cambio de contraseña en prototipo Bartisanal\n\n{cambio_contrasena}"

    with smtplib.SMTP("smtp.gmail.com") as connection:
        connection.starttls()
        connection.login(user=MY_EMAIL, password=MY_PASSWORD)
        connection.sendmail(
            from_addr=MY_EMAIL,
            to_addrs=email,
            msg=mail.encode('utf-8')
        )


def anunciar_compra(email, valor_total, user):
    cambio_contrasena = f"Apreciado cliente. Se notifica que se recibió el pago de su compra" \
                        f"el día {date.today()}.\n" \
                        f"Se facturó un total de ${valor_total}." \
                        f"Dirección de envío: {user.direccion}, ciudad de {user.ciudades.nombre_ciudad}, " \
                        f"depto: {user.departamentos.nombre_depto}.\n" \
                        f"Si presenta alguna queja o reclamo, por este mismo medio y correo."
    mail = f"Subject: Compra efectuada\n\n{cambio_contrasena}"

    with smtplib.SMTP("smtp.gmail.com") as connection:
        connection.starttls()
        connection.login(user=MY_EMAIL, password=MY_PASSWORD)
        connection.sendmail(
            from_addr=MY_EMAIL,
            to_addrs=email,
            msg=mail.encode('utf-8')
        )

def anunciar_venta(valor_total, user):
    cambio_contrasena = f" Se notifica que se recibió el pago de la compra de productos registrados en La plataforma Stripe" \
                        f" el día {date.today()}.\n" \
                        f"Se facturó un total de ${valor_total}." \
                        f"Dirección de envío: {user.direccion}, ciudad de {user.ciudades.nombre_ciudad}, " \
                        f"depto: {user.departamentos.nombre_depto}.\n" \
                        f"Si presenta alguna queja o reclamo, por este mismo medio y correo."
    mail = f"Subject: Venta efectuada\n\n{cambio_contrasena}"

    with smtplib.SMTP("smtp.gmail.com") as connection:
        connection.starttls()
        connection.login(user=MY_EMAIL, password=MY_PASSWORD)
        connection.sendmail(
            from_addr=MY_EMAIL,
            to_addrs=MY_EMAIL,
            msg=mail.encode('utf-8')
        )