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

source $ZSH/oh-my-zsh.sh

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

