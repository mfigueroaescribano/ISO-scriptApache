#!/bin/bash
#ProgramaPrincipal

#Enlazar programa funcional con el de funciones
. ./Funciones.sh

#1.Comprobamos si somsos root
f_permisoroot
echo 'Comprobando permisos ----------------------------------------------'

if [ $? -ne 0 ]; then
    exit 1
fi
echo 'OK ----------------------------------------------------------------'


#2.Comprobar si tenemos conexion a internet 
f_compruebaconexion
echo 'Comprobando conexion ----------------------------------------------'
if [ $? -ne 0 ]; then
    exit 1
fi
echo 'OK ----------------------------------------------------------------'