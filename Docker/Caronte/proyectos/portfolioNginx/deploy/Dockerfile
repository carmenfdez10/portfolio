### partimos de una imagen ubuntu donde se instalará apache
FROM  carmeenn/nginx

# **** Instalaciones ****
RUN apt update && apt install -yq --no-install-recommends \ 
    nano \
    curl \
    net-tools iputils-ping
# consultar el docker hub (imagen) para ver varibles de entorno, directorios, etc.
# Directorio de trabajo dentro del contenedor
WORKDIR /var/www/html 
COPY ./src .
EXPOSE 80 
CMD nginx -DFOREGROUND