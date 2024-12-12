#!/bin/bash

# Funções para as diferentes tarefas

# Atualiza os pacotes do sistema
function atualizar_pacotes() {
  sudo apt update && sudo apt full-upgrade -y
  #flatpak update
}

# Limpa o sistema
function limpar_sistema() {
  sudo apt autoremove --purge -y
  sudo apt autoclean -y
  #flatpak uninstall --unused
}

# Instala novos pacotes
#function instalar_pacotes() {
  # Lista de pacotes a serem instalados (ajuste conforme necessário)
  #pacotes_apt=()
  #pacotes_flatpak=()

  #sudo apt install "${pacotes_apt[@]}" -y
  #flatpak install flathub "${pacotes_flatpak[@]}" -y
#}

# Verifica se há atualizações do kernel e oferece a opção de reiniciar
function verificar_kernel() {
  if [[ $(dpkg -l 'linux-image-*' | grep -c '^ii') -gt 2 ]]; then
    echo "$(date +"%Y-%m-%d %H:%M:%S") - Houve atualizações. Reiniciando o sistema." >> log.txt
    notify-send "Atualização do sistema" "O sistema será reiniciado em 5 segundos."
    sleep 5
    sudo systemctl reboot
    else
    echo "Não há atualizações disponíveis."
    fi
}

# Executa as funções
atualizar_pacotes
limpar_sistema
#instalar_pacotes
verificar_kernel
