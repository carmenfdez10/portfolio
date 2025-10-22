### partimos de una imagen ubuntu donde se instalará apache
FROM  ubuntu
ARG USUARIO
# **** Instalaciones ****
RUN apt update && apt install -yq --no-install-recommends \ 
    apache2 \
    nano \
    curl \
    net-tools iputils-ping
# **** Creación de usuarios ****
# comando interactivos piden datos por terminal
# comandos por lotes (los datos se ponen como parámetros del comando)
RUN useradd -rm -d /home/${USUARIO} -s /bin/bash ${USUARIO} 
RUN echo "$USUARIO:1234" | chpasswd 
RUN echo "Bienvenido al mundo de ${USUARIO}" > /home/${USUARIO}/hello.txt
# consultar el docker hub (imagen) para ver varibles de entorno, directorios, etc.
# Directorio de trabajo dentro del contenedor
WORKDIR /var/www/html 
COPY ./src .
EXPOSE 80 
CMD apachectl -DFOREGROUND