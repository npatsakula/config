export ZSH=/home/mrpink/.oh-my-zsh 

ZSH_THEME="crunch"

plugins=(
    git
    cabal
    command-not-found
    docker
    github
    web-search
    extract
    zsh-autosuggestions
)

export EDITOR=kak

source $ZSH/oh-my-zsh.sh
export PATH=~/.cargo/bin:$PATH
source <(navi widget zsh)

exal () {
    exa -l
}

exat () {
    exa --tree --level=$1 --git --long --all
}

exaf () {
    exa -abghHliS
}

dirgen() {
    mkdir $1 && cd $1
}

dirrem() {
    sudo rm -R $1
}

won() {
    sudo wg-quick up $1
}

woff() {
    sudo wg-quick down $1
}
[ -f "/home/mrpink/.ghcup/env" ] && source "/home/mrpink/.ghcup/env" # ghcup-env
if [ -e /home/mrpink/.nix-profile/etc/profile.d/nix.sh ]; then . /home/mrpink/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
