#!/bin/bash
newUser() {
     useradd -rm -d /home/${USUARIO} -s /bin/bash ${USUARIO}
        echo "${USUARIO}:1234" | chpasswd
        echo "Bienvenida ${USUARIO}..." > /home/${USUARIO}/Bienvenida.txt
        echo "Usuario '${USUARIO}' creado correctamente."
}

main() {
    newUser
    tail -f /dev/null
}

main
#Script que se encarga de configurar el contenedor