# ISO - Script Apache + email

### Descripción
Comprobar que se está ejecutando Apache y si está parado lanzarlo e informar por correo al administrador

### Configuración del escenario

Hay que instalar previamente el paquete `ssmtp`. La configuración del servidor SMTP la realizamos en el fichero `/etc/ssmtp/ssmtp.conf`

Comentamos todas las líneas e incluímos las siguientes:

```
FromLineOverride=YES
UseSTARTTLS=Yes
FromLineOverride=Yes
root=infraestructura@eshipping.es
mailhub=smtp.office365.com:587
AuthUser=infraestructura@eshipping.es
AuthPass=***PASSWORD CORREO***
AuthMethod=LOGIN
```
