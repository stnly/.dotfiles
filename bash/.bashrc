source /etc/profile
export EDITOR="nano"
alias ls='ls --color=auto'
alias la='ls -Fa'
alias ll='ls -Flas'
alias ss='sudo'
alias n='nano'
alias y='yaourt'
alias yS='yaourt -S'
alias ySs='yaourt -Ss'
alias ySyy='yaourt -Syy'
alias ySyya='yaourt -Syy --aur'
alias ySyyu='yaourt -Syyu'
alias ySyyua='yaourt -Syyu --aur'
alias yR='yaourt -R'
alias yRs='yaourt -Rs'
alias yRns='yaourt -Rns'
alias yQ='yaourt -Q'
alias yQdt='yaourt -Qdt'
alias ..='cd ..'
alias da='date "+%A, %B %d, %Y [%T]"'
alias more='| less'
alias gip='git push -u origin master'
alias gic='git commit -a -m'
alias gis='git status'
[ ! "$UID" = "0" ] && archey -c blue
[  "$UID" = "0" ] && archey -c red
#PS1="\[\e[01;31m\]┌─[\[\e[01;35m\u\e[01;31m\]]──[\[\e[00;37m\]${HOSTNAME%%.*}\[\e[01;32m\]]:\w$\[\e[01;31m\]\n\[\e[01;31m\]└──\[\e[01;36m\]>>\[\e[0m\]"
PS1='\[\e[1;34m\][\u@\h \W]\$\[\e[0m\] '

#[[ -s "/home/stan/.rvm/scripts/rvm" ]] && source "/home/stan/.rvm/scripts/rvm"
. .bash_profile

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh