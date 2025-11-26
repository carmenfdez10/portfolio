#!/bin/bash
set -e

make_ssh(){
    sed -i 's/#Port 22/Port 2345/' /etc/ssh/sshd_config
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

    mkdir -p /home/${USUARIO}/.ssh
    cp /root/common/id_ed25519.pub /home/${USUARIO}/.ssh/
    #cat /root/admin/base/common/id_ed25519 >> /home/${USUARIO}/.ssh/authorized_keys
}