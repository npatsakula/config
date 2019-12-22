# Update repos + install update:
sudo apt update && sudo apt dist-upgrade -y

# Add wireguard repository:
sudo apt-apt-repository ppa:wireguard/wireguard
sudo apt update

# Install system and cpp dependencies:
sudo apt install -y htop curl wireguard ranger neovim zsh build-essential clang valgrind

# Install zsh + install zshrc:
curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -fsSL | sh
echo "export ZSH=$(echo ~/.oh-my-zsh)\n$(cat .zshrc)" > ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
chsh -s $(which zsh)

# Copy vim and ranger configs:
cp -r ./{nvim, ranger} ./.config/

# Install rust and haskell toolkit:
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl https://gitlab.haskell.org/haskell/ghcup/raw/master/bootstrap-haskell -sSf | sh
echo "Execute 'ghcup install && ghcup install-cabal && cabal new-install \
    cabal-install && rustup update' after shell reload."



