#!/bin/bash
#ProgramaPrincipal

#Enlazar programa funcional con el de funciones
. ./Funciones.sh

#1.Comprobamos si somsos root
f_somosroot
if [ $? -ne 0 ]; then
    exit 1
fi
echo '1 ok --------------------------------------------------------------'


#2.Comprobar si tenemos conexion a internet 
f_conexion
if [ $? -ne 0 ]; then
    exit 1
fi
echo '2 ok --------------------------------------------------------------'