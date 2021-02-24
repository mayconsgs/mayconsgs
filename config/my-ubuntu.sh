#!/usr/bin/bash

echo "========================================================="
echo "Removendo travas"
echo "========================================================="

sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock;

echo "========================================================="
echo "Atualizando APT"
echo "========================================================="

sudo apt update -y

mkdir /home/$USER/Downloads/deb
cd /home/$USER/Downloads/deb

echo "========================================================="
echo "Baixando arquivos .deb"
echo "========================================================="

wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget -c https://update.code.visualstudio.com/latest/linux-deb-x64/stable
wget -c https://download3.operacdn.com/pub/opera/desktop/74.0.3911.144/linux/opera-stable_74.0.3911.144_amd64.deb

echo "========================================================="
echo "Instalando arquivos .deb"
echo "========================================================="

sudo dpkg -i *.deb

echo "========================================================="
echo "Baixando e Instalando Java 11"
echo "========================================================="

cd /home/$USER/Downloads

wget -c https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz

sudo mkdir /usr/lib/jvm
cd /usr/lib/jvm
sudo tar -xvzf ~/Downloads/openjdk-11+28_linux-x64_bin.tar.gz

export PATH="$PATH:/usr/lib/jvm/jdk-11/bin"
export JAVA_HOME="/usr/lib/jvm/jdk-11"

sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-11/bin/java" 0
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-11/bin/javac" 0
sudo update-alternatives --set java /usr/lib/jvm/jdk-11/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/jdk-11/bin/javac

sudo update-alternatives --list java
sudo update-alternatives --list javac

echo "========================================================="
echo "Instala o Node.js 14"
echo "========================================================="

sudo cd /home/$USER

curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs

echo "========================================================="
echo "Configurando o Node.js 14"
echo "========================================================="

mkdir /home/$USER/.npm-global
npm config set prefix '~/.npm-global'
export PATH="$PATH:/home/$USER/.npm-global/bin"

echo "========================================================="
echo "Instalando pacotes NPM globais"
echo "========================================================="

npm install -g firebase-tools sass @vue/cli yarn

echo "========================================================="
echo "Instalando Git"
echo "========================================================="

sudo apt install -y git

echo "========================================================="
echo "Instalando temas e icones do sistema"
echo "========================================================="

sudo mkdir /home/$USER/.themes
cd /home/$USER/.themes
git clone https://github.com/getomni/gtk.git
mv gtk Omni

cd /home/$USER/Downloads
git clone https://github.com/vinceliuice/Tela-icon-theme.git
sudo Tela-icon-theme/install.sh purple

git clone https://github.com/varlesh/oreo-cursors.git
sudo apt install -y make inkscape ruby

echo "========================================================="
echo "Instalando FLutter"
echo "========================================================="

sudo mkdir /home/$USER/.source
sudo cd /home/$USER/.source
git clone https://github.com/flutter/flutter.git -b stable --depth 1
sudo export PATH="$PATH:/home/$USER/.source/flutter/bin"

echo "========================================================="
echo "Instalações Snap"
echo "========================================================="

sudo snap install mailspring spotify insomnia beekeeper-studio

echo "========================================================="
echo "Instalando OBS"
echo "========================================================="

sudo apt install ffmpeg
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install obs-studio

echo "========================================================="
echo "Instalando Android Studio"
echo "========================================================="

cd /home/$USER/Downloads
wget -c https://redirector.gvt1.com/edgedl/android/studio/ide-zips/4.1.2.0/android-studio-ide-201.7042882-linux.tar.gz
cd /opt
sudo tar -xvzf ~/Downloads/android-studio-ide-201.7042882-linux.tar.gz

sudo apt autoremove

echo "========================================================="
echo "Execute o Android Studio com o comando:"
echo "sudo /opt/android-studio/bin/studio.sh"
echo "========================================================="