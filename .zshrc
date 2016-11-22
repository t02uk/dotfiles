zstyle :compinstall filename "$HOME/.zshrc"

bindkey -e

autoload -Uz compinit
compinit
bindkey "^[[Z" reverse-menu-complete  


RPS1=$'%1F📌 .%*%f'

# via http://liosk.blog103.fc2.com/blog-entry-209.html
autoload -Uz vcs_info
precmd() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    psvar[1]=$vcs_info_msg_0_
}
PROMPT=$'%2F%n@%m%f🐱 %3F%~%f%1v \n%# '

# sbt
export SBT_OPTS="-Xms512M -Xmx2048M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxMetaspaceSize=384M -Dfile.encoding=UTF-8"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

## options
setopt bash_auto_list
setopt list_ambiguous
setopt auto_pushd
setopt auto_menu
setopt magic_equal_subst

## history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=16384
SAVEHIST=16384
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history

## aliases
alias ls='ls -G'
alias ll='ls -Gla'
alias rm='rm -i'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias zp="tmux capture-pane -S -10000\; show-buffer | vim +10000 -Rc 'set ft=vimshell ts=8 nolist nonu' -c 'nmap q :q<cr>' -"


function man() { /usr/bin/man $* -P "col -b | vim -Rc 'setl ft=man ts=8 nomod nolist nonu' -c 'nmap q :q<cr>' -" }

export PATH="/usr/local/heroku/bin:$PATH"

# Peco
function peco-select-history() {
  typeset tac
  if which tac > /dev/null; then
    tac=tac
  else
    tac='tail -r'
  fi
  BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle -R -c
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# process kill
function peco-pkill() {
  for pid in `ps aux | peco | awk '{ print $2 }'`
  do
    kill $pid
    echo "Killed ${pid}"
  done
}
alias pps="peco-pkill"

# rake
peco-rake() { local task=$(rake -vT | peco | cut -d " " -f 2); rake $task }
alias prake='peco-rake'
