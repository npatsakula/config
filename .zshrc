export ZSH=/home/mrpink/.oh-my-zsh 

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

exat () {
    exa --tree --level=$1 --git --long --all
}

exaf () {
    exa -abghHliS
}

