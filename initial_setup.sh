sudo apt update && sudo apt upgrade -y

sudo apt install -y \
  zsh \
  git \
  tig \
  tmux \
  vim \
  ssh \
  magic-wormhole \
  fzf \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  zsh-completions

sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config && sudo systemctl restart sshd

RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s "$(command -v zsh)" "$USER"

git clone https://github.com/Djadih/dotfiles.git ~/dotfiles && cd ~/dotfiles && cp -rf .[^.]* ~/

sudo reboot
