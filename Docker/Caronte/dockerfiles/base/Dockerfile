FROM ubuntu
ARG USUARIO
ARG PASSWORD
RUN apt update && aot install -yq --no-install-recommends \
    nano \
    git curl wget \
    iputils-ping net-tools \ 
    sudo 

RUN useradd -rm -d /home/{$USUARIO} -s /bin/bash ${USUARIO} 
RUN echo "${USUARIO}:${PASSWORD}" | chpasswd 