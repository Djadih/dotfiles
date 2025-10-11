sudo apt update && sudo apt upgrade -y

sudo apt install -y zsh git tmux vim magic-wormhole ssh
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config && sudo systemctl restart sshd

RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/Djadih/dotfiles.git ~/dotfiles && cd ~/dotfiles && cp -rf .[^.]* ~/

