#!/bin/bash
#Carga las variables de entorno pasadas desde el docker compose
set -e

check_usuario ( {
    if grep -u "${USUARIO}" /etc/passwd
    then
        echo "${USUARIO} se encuentra er el sistema" >> /root/logs/informe.log
        return 1
    else 
        echo "${USUARIO} no se encuentra en el sistema" >> /root/logs/informe.log
        return 0
    fi
}
)

check_home () {
    if [ ! -d "/home/${USUARIO}" ]
    then
        echo "/home/${USUARIO} no existe" >> /root/logs/informe.log
        return 0 ##true
    else 
        echo "/home/${USUARIO} existe" >> /root/logs/informe.log
        return 1 ##false
    fi
}

newUser() {
    check_usuario
    if  ["$?" -eq 0]  #no existe usuario
    then
        check_home
        if ["$?" -eq 0]
        then 
            useradd -rm -d /home/${USUARIO} -s /bin/bash ${USUARIO}
            echo "${USUARIO}:1234" | chpasswd
            echo "Bienvenida ${USUARIO}..." > /home/${USUARIO}/Bienvenida.txt
            echo "Usuario '${USUARIO}' creado correctamente."
            echo "--> Usuario ${USUARIO} creado" >> /root/logs/informe.log
        else
            echo "--> Usuario ${USUARIO} no creado, existe home" >> /root/logs/informe.log
        fi
    else
        echo "--> Usuario ${USUARIO} no creado, existe en el passwd" >> /root/logs/informe.log
fi 
}

main() {
    touch /root/logs/informe.log
}

main() {
    newUser
    tail -f /dev/null
}

main
#Script que se encarga de configurar el contenedor