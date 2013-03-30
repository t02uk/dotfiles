# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
#
#

# via http://www.foxking.org/oldsite/?20070618S2
#PS1=$'%n@%m:%~\n$ '
#RPS1=$'%D'

# via http://liosk.blog103.fc2.com/blog-entry-209.html
autoload -Uz vcs_info
precmd() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    psvar[1]=$vcs_info_msg_0_
}
PROMPT=$'%2F%n@%m%f %3F%~%f%1v\n%# '


zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

## options
setopt BASH_AUTO_LIST
setopt LIST_AMBIGUOUS
setopt AUTO_PUSHD

## history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=16384
SAVEHIST=16384
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history



## automatic atatch
screen -q -ls
if [ $? -eq 9 ]; then 
    screen  
else
    screen -x
fi

## aliases
alias ls='ls -G'
alias ll='ls -Gla'
