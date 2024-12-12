#!/bin/bash

# Função para atualizar o sistema
function atualizar_sistema() {
    sudo apt update && sudo apt upgrade -y
}

# Função para limpar o sistema
function limpar_sistema() {
    # Remove pacotes órfãos
    sudo apt autoremove
    # Limpa a cache do apt
    sudo apt autoclean
}

# Função para verificar se um pacote está instalado (para pacotes do sistema)
function esta_instalado() {
    dpkg -s "$1" >/dev/null 2>&1
}

# Função para instalar um pacote se ele não estiver instalado
function instalar_pacote() {
    if ! esta_instalado "$1"; then
        sudo apt install -y "$1" || { echo "Erro ao instalar $1"; return 1; }
    fi
}

# Função para instalar um pacote Flatpak se ele não estiver instalado
function instalar_pacote_flatpak() {
    if ! flatpak list --user | grep -q "$1"; then
        flatpak install flathub -y "$1" || { echo "Erro ao instalar $1"; return 1; }
    fi
}

# Lista de pacotes a serem instalados
pacotes=("fastfetch" "libnotify" "foomatic-db" "flatpak" "openjdk-11-jdk" "gnome-boxes" "thunderbird" "vlc" "audacious")
pacotes_flatpak=("com.spotify.Client" "us.zoom.Zoom" "org.onlyoffice.desktopeditors" "com.skype.Client" "org.raspberrypi.rpi-imager" "org.gnome.Firmware" "org.kde.kdenlive" "ca.littlesvr.asunder" "org.chromium.Chromium" "org.gnome.gitlab.YaLTeR.VideoTrimmer" "com.warlordsoftwares.media-downloader" "org.gtkhash.gtkhash" "fr.handbrake.ghb" "net.fasterland.converseen" "com.transmissionbt.Transmission" "org.fedoraproject.MediaWriter")

# Instala os pacotes
for pacote in "${pacotes[@]}"; do
    instalar_pacote "$pacote"
done

for pacote in "${pacotes_flatpak[@]}"; do
    instalar_pacote_flatpak "$pacote"
done

# Verifica se o pacote libnotify está instalado (necessário para as notificações)
if ! command -v notify-send &> /dev/null; then
    sudo apt install libnotify-bin
    echo "O pacote libnotify foi instalado."
fi

# Função para verificar se há atualizações e informar o usuário
function verificar_atualizacoes() {
    # Verifica por atualizações no apt
    sudo apt update && sudo apt list --upgradable 2>&1 | grep -q '^Upgrade:'
    if [ $? -eq 0 ]; then
        echo "$(date +"%Y-%m-%d %H:%M:%S") - Há atualizações disponíveis. Deseja atualizar agora? (s/n)"
        read resposta
        if [[ $resposta =~ ^[Yy]$ ]]; then
            atualizar_sistema
        fi
    else
        echo "$(date +"%Y-%m-%d %H:%M:%S") - Não há atualizações disponíveis."
    fi

    # Verifica por atualizações no Flatpak
    flatpak update --remote flathub
    if [ $? -eq 0 ]; then
        echo "$(date +"%Y-%m-%d %H:%M:%S") - Há atualizações disponíveis para os aplicativos Flatpak."
    fi
}

# Executa as funções
verificar_atualizacoes
atualizar_sistema
limpar_sistema
instalar_pacotes