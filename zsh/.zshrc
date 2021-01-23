export ZSH=/home/nikita/.oh-my-zsh

ZSH_THEME="norm"

plugins=(
    command-not-found
    zsh-autosuggestions
    ssh-agent

    # gsb -- git status -Sb
    # gst -- git status
    # gpf -- git push --force-with-lease
    # gd -- git diff
    # ga -- git add
    # gaa -- git add --all
    git

    # `cp` with progress bar(`rsync`), use as `cpv`:
    cp
)

export EDITOR=kak;
export VISUAL=kak;

source $ZSH/oh-my-zsh.sh
export PATH=~/.cargo/bin:$PATH
[ -f "/home/nikita/.ghcup/env" ] && source "/home/nikita/.ghcup/env" # ghcup-env

exat () {
    exa --tree --level=$1 --git --long --all
}

exaf () {
    exa -abghHliS
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
