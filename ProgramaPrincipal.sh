#!/bin/bash
#ProgramaPrincipal

#Enlazar programa funcional con el de funciones
. ./Funciones.sh

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
if [ $? -e 0 ]; then
    echo 'El servicio ya está activo'
else
    f_arrancaservicio
    echo 'Arrancando'
    systemctl status apache2
fi

# Ya si no está activo levanta el servicio, falta poner bien la salida por pantalla
# y volver a comprobar. Falta notificación por correo.