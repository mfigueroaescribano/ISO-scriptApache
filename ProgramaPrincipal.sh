#!/bin/bash
#ProgramaPrincipal

#Enlazar programa funcional con el de funciones
. ./Funciones.sh

read -p 'Introduzca su email para recibir notificaciones: ' correo
echo 'El correo electrónico introducido es: $correo'

#1.Comprobamos si somsos root
echo 'Comprobando permisos...'
f_permisoroot
if [ $? -ne 0 ]; then
    exit 1
fi
echo 'OK'


#2.Comprobar si tenemos conexion a internet 
echo 'Comprobando conexión a internet...'
f_compruebaconexion
if [ $? -ne 0 ]; then
    exit 1
fi
echo 'OK'


#3. Comprobando servicio Apache
echo 'Comprobando servicio Apache...'
f_compruebaservicio
if [ $? -eq 0 ]; then
    echo 'El servicio ya está activo'
else
    f_arrancaservicio
    echo 'Arrancando'
    systemctl status apache2
    echo -e "Subject: Servicio Apache iniciado\n\nEl servicio Apache acaba de ser iniciado en su servidor" | sendmail -f infraestructura@eshipping.es $correo

fi