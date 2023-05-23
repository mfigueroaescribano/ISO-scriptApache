#!/bin/bash
#ProgramaPrincipal

verde="\e[32m"

#Enlazar programa funcional con el de funciones
. ./Funciones.sh

read -p 'Introduzca su email para recibir notificaciones: ' correo
echo 'El correo electrónico introducido es:'
echo -e ${verde} $correo

sleep 2

#1.Comprobamos si somsos root
echo 'Comprobando permisos...'
f_permisoroot
if [ $? -ne 0 ]; then
    exit 1
fi
echo 'OK'

sleep 2

#2.Comprobar si tenemos conexion a internet 
echo 'Comprobando conexión a internet...'
f_compruebaconexion
if [ $? -ne 0 ]; then
    exit 1
fi
echo 'OK'

sleep 2

#3. Comprobando servicio Apache
echo 'Comprobando servicio Apache...'
f_compruebaservicio
if [ $? -eq 0 ]; then
    echo 'El servicio ya está activo'
else
    f_arrancaservicio
    echo 'Arrancando el servicio...'
    f_compruebaservicio
    if [ $? -eq 0 ]; then
        echo 'Notificando por correo...'
        echo -e "Subject: Servicio Apache iniciado\n\nEl servicio Apache acaba de ser iniciado en su servidor" | sendmail -f infraestructura@eshipping.es $correo
        echo -e 'Inicio completado'
    else
        sleep 2
        echo 'El arranque del servicio ha fallado'
        echo 'Se notificará por correo'
        echo -e "Subject: Arranque de Apache fallido\n\nEl servicio Apache no ha podido ser iniciado en su servidor" | sendmail -f infraestructura@eshipping.es $correo
        echo 'Notificado'
    fi
fi