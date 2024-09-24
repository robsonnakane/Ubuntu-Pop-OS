#!/bin/bash

###Debian###

#Substituir a sources list do arquivo "sudo nano /etc/apt/sources.list" com o texto abaixo sem comentar as linhas deb:

## See https://wiki.debian.org/SourcesList for more information.
#deb http://deb.debian.org/debian trixie main non-free-firmware
#deb-src http://deb.debian.org/debian trixie main non-free-firmware

#deb http://security.debian.org/debian-security/ trixie-security main non-free-firmware
#deb-src http://security.debian.org/debian-security/ trixie-security main non-free-firmware

#Após substituição executar o seguinte comando:
#sudo rm /var/lib/apt/lists/lock

##Execução do arquivo de atualização no terminal##
#/home/robsonnakane/Documentos/'Atualização Debian XFCE.sh'

#Edição do arquivo no terminal#
#nano /home/robsonnakane/Documentos/'Atualização Debian XFCE.sh'

###Atualização completa do sistema###
sudo systemctl stop packagekit;
sudo apt autoremove -y;
sudo apt update -y;
sudo apt full-upgrade -y;

##instalação dos programas nativos##
#sudo apt install screenfetch -y; sudo apt install simple-scan -y; sudo apt install btop -y; sudo apt install gnome-boxes -y; sudo apt install kitty -y; sudo apt install flatpak -y; sudo apt install gnome-disk-utility -y;

##Pesquisar o número da última versão com sudo apt search openjdk##
#sudo apt install openjdk-xx-jdk -y;

##instalação dos programas Flatpak##
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
#sudo flatpak install flathub com.spotify.Client -y; sudo flatpak install flathub org.videolan.VLC -y; sudo flatpak install flathub com.valvesoftware.Steam -y; sudo flatpak install flathub us.zoom.Zoom -y; sudo flatpak install flathub org.onlyoffice.desktopeditors -y; sudo flatpak install flathub com.skype.Client -y; sudo flatpak install flathub org.raspberrypi.rpi-imager -y; sudo flatpak install flathub org.gnome.Firmware -y; sudo flatpak install flathub org.kde.kdenlive -y; sudo flatpak install flathub org.inkscape.Inkscape -y; sudo flatpak install flathub org.mozilla.Thunderbird -y; sudo flatpak install flathub org.fedoraproject.MediaWriter -y; sudo flatpak install flathub org.gnome.gedit -y; sudo flatpak install flathub org.atheme.audacious -y; sudo flatpak install flathub ca.littlesvr.asunder -y; sudo flatpak install flathub ar.com.tuxguitar.TuxGuitar -y; sudo flatpak install flathub com.anydesk.Anydesk -y; sudo flatpak install flathub org.chromium.Chromium -y;


##Atualização do Flatpak##
flatpak update -y;

sudo systemctl reboot
