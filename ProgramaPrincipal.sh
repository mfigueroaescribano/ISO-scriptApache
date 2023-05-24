#!/bin/bash
#ProgramaPrincipal
#Autor: Miguel Figueroa Escribano
#Repositorio: https://github.com/mfigueroaescribano/ISO-scriptApache

verde="\e[32m"
reset="\e[0m"
rojo="\e[31m"

#Enlazar programa funcional con el de funciones
. ./Funciones.sh

read -p 'Introduzca su email para recibir notificaciones: ' correo
regex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"

if echo "$correo" | grep -Pq "$regex"; then
    echo -e "El correo electrónico" $correo es ${verde} correcto" ${reset}"
else
    echo -e "Dirección de correo ${rojo} no válido ${reset}"
    exit 1
fi

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
        echo -e ${verde}'● Inicio completado'${reset}
    else
        sleep 2
        echo -e ${rojo}'El arranque del servicio ha fallado'${reset}
        echo 'Se notificará por correo'
        echo -e "Subject: Arranque de Apache fallido\n\nEl servicio Apache no ha podido ser iniciado en su servidor" | sendmail -f infraestructura@eshipping.es $correo
        echo 'Notificado'
    fi
fi