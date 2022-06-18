setup_docker() {
  sudo usermod -aG docker $USER;
  newgrp docker;
  sudo systemctl enable docker;
  sudo systemctl start docker;
}

setup_git() {
  if [ -z "$(git config --global user.name)"  ]; then
    read -p "git email: " email < /dev/tty;
    read -p "git user:  " name < /dev/tty;
    git config --global user.name "$name";
    git config --global user.email "$email";
  fi

  git config --global core.editor "code"
  git config --global alias.st "status -s";
  git config --global alias.br "branch";
  git config --global alias.ck "checkout";
  git config --global alias.cm '!git add . && git commit -m';
  git config --global alias.ps "push";
  git config --global alias.cf 'config --global --list';
  git config --global alias.lo 'log --oneline';
  ssh-keygen;
}
