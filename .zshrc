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

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

alias -g amorning="sudo apt update && sudo apt dist-upgrade -y"
alias -g rmorning="rustup update"
alias -g hmorning="cabal update"

alias -g morning="amorning && rmorning && hmorning"

dirgen() {
    mkdir $1 && cd $1
}

dirrem() {
    sudo rm -R $1
}

