#!/usr/bin/bash

## Removendo travas de permição ##
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock;

sudo apt update -y

mkdir /home/$USER/Downloads/programas

cd /home/$USER/Downloads/programas

## Baixando arquivos .deb ##

## Chrome ##
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
## Insomnia ##
wget -c https://updates.insomnia.rest/downloads/ubuntu/latest?ref=https%3A%2F%2Fwww.google.com%2F&app=com.insomnia.app&source=website
## MailSpring ##
wget -c https://updates.getmailspring.com/download?platform=linuxDeb
## Visual Studio Code ##
wget -c https://update.code.visualstudio.com/latest/linux-deb-x64/stable

sudo dpkg -i *.deb ## Instala os arquivos .deb ##

cd ../../

## Instala o Node.js ##
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs
## Configura o npm ##
NPM_CONFIG_PREFIX=~/.npm-global
source ~/.profile
## Instala o Firebase Tools ##
npm install -g firebase-tools

## Instala o Git ##
sudo apt install -y git

## Instalando o FLutter ##
mkdir /home/$USER/.source
cd /home/$USER/.source
git clone https://github.com/flutter/flutter.git -b stable --depth 1
cd ..
## export PATH="$PATH:.source/flutter/bin" ##

