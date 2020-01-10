# Setup mirrors by location:
sudo pacman-mirrors --geoip && sudo pacman -Syyu

# Update repos:
sudo pacman -Syu

# 'linux-headers' is deps for 'wireguard-dkms'
sudo pacman -S linux-headers wireguard-tools wireguard-dkms zsh \
    neovim ranger ctags bash-language-server rustup stack

# For some reason '.cargo/bin' is not added.
export PATH=~/.cargo/bin:$PATH

rustup toolchain default stable
rustup toolchain add nightly
rustup component add rust-src rustfmt-preview clippy-preview rls

# exa ~ ls | ripgrep ~ grep | sd ~ sed
cargo install exa ripgrep sd

# Install zsh + install .zshrc:
curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -fsSL | sh
echo "export ZSH=$(echo ~/.oh-my-zsh) \n\n$(cat ./.zshrc)" > ./.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
chsh -s $(which zsh)

# Copy vim and ranger configs:
rm -R ~/.config/ranger/ && rm -R ~/.config/nvim/ && rm ~/.zshrc
ln -s "$(pwd)/ranger" ~/.config && ln -s "$(pwd)/nvim" ~/.config 
ln -s "$(pwd)/.zshrc" ~/

