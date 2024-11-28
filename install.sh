#!/bin/bash

# Actualizar el sistema
echo "Actualizando el sistema..."
sudo apt update && sudo apt upgrade -y

# Instalar paquetes comunes
echo "Instalando paquetes básicos..."
sudo apt install -y curl wget git vim build-essential

# Instalar Python y configuraciones básicas
echo "Instalando Python y configurando el entorno virtual..."
sudo apt install -y python3 python3-pip python3-venv
python3 -m venv ~/myenv
echo "source ~/myenv/bin/activate" >> ~/.bashrc
source ~/.bashrc

# Instalar Docker
echo "Instalando Docker..."
sudo apt install -y apt-transport-https ca-certificates gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
echo "Docker instalado correctamente. Por favor, reinicia tu terminal."

# Instalar Dia
echo "Instalando Dia..."
sudo apt install -y dia

# Instalar Umbrello
echo "Instalando Umbrello..."
sudo apt install -y umbrello

# Configurar Git
echo "Configurando Git..."
read -p "Introduce tu nombre para Git: " git_name
read -p "Introduce tu correo para Git: " git_email
git config --global user.name "$git_name"
git config --global user.email "$git_email"
git config --global core.editor "vim"

# Configurar firewall (ufw)
echo "Configurando el firewall (UFW)..."
sudo apt install -y ufw
sudo ufw allow OpenSSH
sudo ufw enable
echo "Firewall configurado."

# Limpiar el sistema
echo "Limpiando el sistema..."
sudo apt autoremove -y && sudo apt autoclean

# Finalización
echo "Instalación y configuración completadas. ¡Disfruta tu entorno Linux!"
