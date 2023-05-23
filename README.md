# ISO - Script Apache + email

### Descripción
Al ejecutar el script se comprueba si está corriendo el servicio Apache. Si está activo, muestra por pantalla que ya está activo y finaliza el script. Si no lo está, levanta el servicio y envía un correo electrónico a la dirección que se pide en primer lugar para informar de que se ha levantado exitosamente el servicio Apache.

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
