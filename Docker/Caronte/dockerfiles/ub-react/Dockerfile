FROM carmeenn/nginx
USER root
ARG PROYECTO

# Instalamos Node.js 20 (necesario para tu versión de Vite y React Router)
RUN apt update && apt install -y curl ca-certificates gnupg
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt install -y nodejs

RUN mkdir -p /root/admin/ubreact/admin
WORKDIR /var/www/html

# Copiamos el contenido del proyecto (donde debe estar tu package.json)
COPY ./proyectos/psweb/ubreact/deploy/src /var/www/html

# Copiamos los scripts de administración
COPY ./dockerfiles/ub-react/admin/start.sh /root/admin/ubreact/admin/start.sh
RUN chmod +x /root/admin/ubreact/admin/start.sh

EXPOSE 80

ENTRYPOINT ["/root/admin/ubreact/admin/start.sh"]