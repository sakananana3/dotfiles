# ===== Go through the PATH =====
# Scala
export PATH=${HOME}/.scalaenv/bin:${PATH}
eval "$(scalaenv init -)"

# Rust
source "$HOME/.cargo/env"

# NodeJS repository manager
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Git
alias python="/usr/bin/python3"
source ~/.zsh/git-prompt.sh
# ===== prompt =====
GIT_PS1_SHOWDIRTYSTATE=true      # *:unstaged, +:staged
GIT_PS1_SHOWUNTRACKEDFILES=true  # %:untracked
GIT_PS1_SHOWSTASHSTATE=true      # $:stashed
GIT_PS1_SHOWUPSTREAM=auto        # >:ahead, <:behind
GIT_PS1_STATESEPARATOR=':'

setopt PROMPT_SUBST ; PS1='%F{cyan}%n@%~%f%F{red}$(__git_ps1 "(%s)")%f : '

# ===== Alias  =====
function mkcd {
  mkdir -p $* && cd $_
}
alias mkcd="mkcd"



# ===== OTHER =====
autoload -U compinit
compinit

#fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# cd gitworktree
function cdworktree() {
    # カレントディレクトリがGitリポジトリ上かどうか
    git rev-parse &>/dev/null
    if [ $? -ne 0 ]; then
        echo fatal: Not a git repository.
        return
    fi

    local selectedWorkTreeDir=`git worktree list | fzf | awk '{print $1}'`

    if [ "$selectedWorkTreeDir" = "" ]; then
        # Ctrl-C.
        return
    fi

    cd ${selectedWorkTreeDir}
}

