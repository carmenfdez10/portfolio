FROM carmeenn/nginx
USER root
ARG PROYECTO

RUN apt update && apt install -yq --no-install-recommends 


RUN chown -R www-data /var/www/html
RUN chmod -R 755 /var/www/html

RUN mkdir -p /var/log/nginx
EXPOSE 80

WORKDIR /var/www/html
COPY ./proyectos/${PROYECTO}/src .
RUN mkdir -p /root/admin/miPortfolioNginx
COPY ./dockerfiles/miPortfolioNginx /root/admin/miPortfolioNginx
RUN chmod +x /root/admin/miPortfolioNginx/admin/start.sh
ENTRYPOINT ["/root/admin/miPortfolioNginx/admin/start.sh"]