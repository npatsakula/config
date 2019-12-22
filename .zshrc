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

