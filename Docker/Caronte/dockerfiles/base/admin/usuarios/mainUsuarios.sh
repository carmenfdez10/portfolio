#!/bin/bash

set -e 

source /root/admin/usuarios/mainUsuarios.sh

main() {
    #gestion de usuarios --> getsUsuarios.sh
    #gestion de nsq --> 
    #gestion de 
    touch /root/logs/informe.log
    newUser
    tail -f /dev/null
}

main
#Script que se encarga de configurar el contenedor


