#!/bin/bash

###Pop OS###
###Atualização completa do sistema###
sudo apt autoremove -y;
pop-upgrade release upgrade;
sudo apt update -y;
sudo apt upgrade -y;
sudo apt full-upgrade -y;



##Execução do arquivo de atualização no terminal##
#/home/robsonnakane/Documentos/'Atualização POP OS.sh'#

#Edição do arquivo no terminal#
#nano /home/robsonnakane/Documentos/'Atualização POP OS.sh'#


##Instalação de programas e Flatpak##
#sudo apt install neofetch -y; sudo apt install simple-scan -y; sudo apt install gnome-tweaks -y; sudo apt install java-latest-openjdk -y; sudo apt install btop -y;

##Instalação dos programas Flatpak##
#flatpak install flathub com.spotify.Client -y; flatpak install flathub org.videolan.VLC -y; flatpak install flathub com.valvesoftware.Steam -y; flatpak install flathub us.zoom.Zoom -y; flatpak install flathub org.kde.kdenlive -y; flatpak install flathub org.onlyoffice.desktopeditors -y; flatpak install flathub com.skype.Client -y; flatpak install flathub com.adobe.Flash-Player-Projector -y; flatpak install flathub org.gnome.Extensions -y; flatpak install flathub org.gnome.Boxes -y; flatpak install flathub com.transmissionbt.Transmission -y; flatpak install flathub org.mypaint.MyPaint -y; flatpak install flathub org.mozilla.Thunderbird -y; flatpak install flathub org.raspberrypi.rpi-imager -y; flatpak install flathub org.fedoraproject.MediaWriter -y; flatpak install flathub org.gnome.gedit -y; flatpak install flathub com.google.Chrome -y; flatpak install flathub org.gnome.Firmware -y; flatpak install flathub org.atheme.audacious -y; flatpak install flathub ca.littlesvr.asunder -y; flatpak install flathub ar.com.tuxguitar.TuxGuitar -y;

##Atualização do Flatpak##
flatpak update -y

systemctl reboot
