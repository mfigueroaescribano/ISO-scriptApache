#!/bin/bash
#Fichero de funciones

rojo="\e[31m"
reset="\e[0m"



function f_permisoroot {
    if [ $UID -eq 0 ]; then
        return 0
    else
        echo "Para ejecutar este script es necesario que seas superusuario"
        return 1
    fi
}

function f_compruebaconexion {
    if ping -c 1 -q 8.8.8.8 > /dev/null; then
        return 0
    else
        echo -e "Para ejecutar este script es necesario que disponga de conexion a internet"
        return 1
    fi
 }

 function f_compruebaservicio {
    if [ $(systemctl is-active apache2) = "active" ]; then
        return 0
    else
        echo -e ${rojo}'El servicio Apache no está activo'${reset}
        return 1
    fi
 }

 function f_arrancaservicio {
    systemctl start apache2;
 }