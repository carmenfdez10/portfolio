### Se especifica la instalación de librerías y configuraciones para crear los contenedores personalizados 

#Imagen con apache instalado
#FROM ubuntu + instalación personal de Apache
FROM httpd:2.4 
# consultar el docker hub (imagen) para ver varibles de entorno, directorios, etc.
# Directorio de trabajo dentro del contenedor
WORKDIR /usr/local/apache2/htdocs 
COPY ./src .
EXPOSE 80 


