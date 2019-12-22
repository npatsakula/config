# Update repos + install update:
 sudo apt update && sudo apt dist-upgrade -y

# Add wireguard repository:
sudo apt-apt-repository ppa:wireguard/wireguard
sudo apt update

# Install system and cpp dependencies:
sudo apt install -y \
    htop curl autoconf \
    wireguard ranger neovim \
    zsh build-essential clang \
    valgrind resolvconf

# Install ctags:
sudo apt install -y libjansson-dev
git clone https://github.com/universal-ctags/ctags.git --depth=1
cd ctags && ./autogen.sh && ./configure && make && sudo make install

# Install zsh + install zshrc:
curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -fsSL | sh
echo "export ZSH=$(echo ~/.oh-my-zsh)\n$(cat ./.zshrc)" > ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
chsh -s $(which zsh)

# Copy vim and ranger configs:
cp -r ./ranger/ ~/.config/
cp -r ./nvim/ ~/.config/

# Install rust and haskell toolkit:
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl https://gitlab.haskell.org/haskell/ghcup/raw/master/bootstrap-haskell -sSf | sh
echo "Execute 'ghcup install && ghcup install-cabal && cabal new-install \
    cabal-install && rustup update' after shell reload."



