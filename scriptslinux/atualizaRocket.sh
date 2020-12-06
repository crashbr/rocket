#!/bin/bash

#############################################################################
#                                                                           #
# Nome: atualizaRocket.sh                                                   #
# Autor: Erik Silva Sobral (eriksobral@gmail.com)                           #
# Data 06/12/2020                                                           #
#                                                                           #
# Descrição: Script para atualização do Rocket.chat no Debian 9             #
#                                                                           #
# Uso: ./atualizaRocket.sh                                                  #
#                                                                           #
# Caso o rocket não inicie após a atualização, pode verificar se o pacote   #
# NPM está na mesma versão da nova atualização.                             #
#                                                                           #
#############################################################################

systemctl stop rocketchat
rm -rf /opt/Rocket.Chat
curl -L https://releases.rocket.chat/latest/download -o /tmp/rocket.chat.tgz
tar -xzf /tmp/rocket.chat.tgz -C /tmp
cd /tmp/bundle/programs/server && npm install
mv /tmp/bundle /opt/Rocket.Chat
chown -R rocketchat:rocketchat /opt/Rocket.Chat
systemctl start rocketchat