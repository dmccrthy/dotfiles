#!/usr/bin/env bash
#
# install.sh - Automatic system configuration
#
# Description:
#   This is a script to automatically setup a desktop with my preferred
#   configs. This also installs the software I regularly use with DNF and
#   Flatpak. This script is intended for Fedora and likely won't work on
#   other distros.
#
# Author: Dan McCarthy
# Date: 2/25/2026

# ===
# Log formatted messages to stdout.
# 
# Parameters:
#   Logging level (ERROR, INFO, etc.)
#   Message to output
# ===
function log() {
    echo "[$1] $2"
}

if [[ "$EUID" -ne 0 ]]; then
    log "ERROR" "install.sh must be run as root."
    exit 1
fi

# === Repo Setup === 

log "INFO" " Setting up repositories."

dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
rpm --import https://packages.microsoft.com/keys/microsoft.asc && echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# === Software Installs (DNF) ===

dnf install -y brave-browser code krita inkscape wireshark audacity obs remmina rkhunter clamav steam discord wireguard-tools wine zsh gcc make valgrind fastfetch vim nmap python3-pip telnet tcl expect openldap-clients

dnf install -y java-21-openjdk java-21-openjdk-devel

dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose

# === Software Installs (Flatpak) ===


# === Software Installs (Manual Setup) ===

# === Download Fonts ===

# === User Configuration ===

