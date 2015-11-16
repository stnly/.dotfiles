# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="stnly"


#Single character aliases
alias n='ncmpcpp'
alias m='mutt'
alias g='git'
alias v='vim'
alias h="history"

#Safe rm
alias rm='rm -i'

#For updating system
alias y='yaourt'
alias yS='yaourt -S'
alias ySs='yaourt -Ss'
alias ySyy='yaourt -Syy'
alias ySyya='yaourt -Syy --aur'
alias ySyyu='yaourt -Syyu'
alias ySyua='yaourt -Syu --aur'
alias ySyyua='yaourt -Syyu --aur'
alias yR='yaourt -R'
alias yRs='yaourt -Rs'
alias yRns='yaourt -Rns'
alias yQ='yaourt -Q'
alias yQdt='yaourt -Qdt'

#gcc for c code.
alias wcc='gcc -Wall -Werror -O -o'

#Find top largest folders
alias dush='du -sm *|sort -n|tail'

alias reload=". ~/.zshrc && echo 'ZSH config reloaded'"

#CSE account
#alias cse='shht436@cse.unsw.edu.au'

#IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

#eSpeak
alias say='echo "$1" | espeak -s 140 2>/dev/null'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Removed autojump plugin due to some issue with the sourcing.
plugins=(
    mix
    ruby
    chruby
    gem
    npm
    archlinux
    git
    heroku
    vagrant
    dirpersist
    zsh_reload
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

unset GREP_OPTIONS

# Customize to your needs...
export PATH=/usr/local/heroku/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:/home/stan/src/scripts:/Users/stan/bin

#jenv
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"

#pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

#z
#. /usr/lib/z.sh
. `brew --prefix`/etc/profile.d/z.sh

# RUBIES+=(~/.rbenv/versions/*)
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
source /usr/local/share/gem_home/gem_home.sh

RPS1="%{$fg_bold[red]%}r:%{$reset_color%}%{$fg[red]%}\$(ruby -v|sed -e 's/(.*//' -e 's/ /-/')%{$reset_color%} $EPS1"
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})[%*]%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time=$time_enabled
GIT_PROMPT='$(git_prompt_info)'
archey -c
PROMPT="${time} %{$fg[blue]%}%n@%m:%{$fg[white]%}%~
$GIT_PROMPT%{$reset_color%}%(!.#.$)%{$reset_color%} "


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"
