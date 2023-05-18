#!/bin/bash
#Fichero de funciones

function f_somosroot {
    if [ $UID -eq 0 ]; then
        return 0
    else
        echo "Para ejecutar este script es necesario que seas superusuario"
        return 1
    fi
}

function f_conexion {
         if ping -c 1 -q 8.8.8.8 > /dev/null; then
         return 0
         else
         echo -e "Para ejecutar este script es necesario que disponga de conexion a internet"
         return 1
         fi
 }
