# Setup mirrors by location:
sudo pacman-mirrors --geoip && sudo pacman -Syyu

# Update repos:
sudo pacman -Syyu

# Install apps:
sudo pacman -S \
    # dmenu alternative
    rofi \
    # Required for WG dkms:
    linux-headers \
    # VPN tools:
    wireguard-tools wireguard-dkms \
    # Shell:
    zsh \
    # File manager:
    ranger \
    # C/C++ compiler + language server:
    clang \
    # Bash language server:
    bash-language-server \
    # Rust toolchain manager:
    rustup \
    # Text editor + LSC:
    kakoune kak-lsp
    # System tools:
    ripgrep bat exa fd tokei flameshot tokei

# For some reason '.cargo/bin' is not added.
export PATH=~/.cargo/bin:$PATH

# Install zsh + install .zshrc:
curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -fsSL | sh
echo "export ZSH=$(echo ~/.oh-my-zsh) \n\n$(cat ./.zshrc)" > ./.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
chsh -s $(which zsh)

ln -s "$(pwd)/nvim" ~/.config
ln -s "$(pwd)/kak" ~/.config
ln -s "$(pwd)/kak-lsp" ~/.config
rm ~/.zshrc && ln -s "$(pwd)/.zshrc" ~/
