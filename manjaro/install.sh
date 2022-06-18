#!/bin/bash
source "./setup.sh";

log_green() {
    echo -e "\e[38;2;113;247;159m$1\e[0m"
}

log_yellow() {
    echo -e "\e[38;2;249;220;92m$1\e[0m"
}

# Create temporary folder for downloaded files
mkdir -p tmp && cd tmp;

log_green "Updating pacman mirrors and packages"
sudo pacman-mirrors --continent && sudo pacman -Syyu;

log_green "\nInstalling yay and downloading packages list"
sudo pacman -S yay;
curl https://gist.githubusercontent.com/ddanielcruz/f82506bb392503889d282442804483ba/raw/packages --output packages.txt

log_green "Creating default directories"
mkdir -p ~/Projects ~/Studies ~/Work;

log_green "\nInstalling packages"
while IFS=, read -r package; do
  log_yellow "\nInstalling $package";
  yay -S $package --noconfirm;
done < packages.txt

log_green "\nSetting up installed packages"
setup_git;
setup_docker;

# Clean up downloaded files
cd .. && rm -rf tmp;
