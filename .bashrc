#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[33m\]$(__git_ps1 " (%s)") \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

alias t=todo.sh
alias vlc="vlc --fullscreen"
export EDITOR="vim"

PATH="/usr/lib/ccache/bin/:${PATH}:/home/aelg/bin"

function proxy(){
    export SOCKS_SERVER="localhost:8080"
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    echo -e "Proxy environment variable set."
}
function proxyoff(){
    unset SOCKS_SERVER
    echo -e "Proxy environment variable removed."
}

function swap()
{
  tmpfile=$(mktemp $(dirname "$1")/XXXXXX)
  mv "$1" "$tmpfile" && mv "$2" "$1" &&  mv "$tmpfile" "$2"
}

randpw(){ 
  < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16};echo;
}

colors() {
  local fgc bgc vals seq0

  printf "Color escapes are %s\n" '\e[${value};...;${value}m'
  printf "Values 30..37 are \e[33mforeground colors\e[m\n"
  printf "Values 40..47 are \e[43mbackground colors\e[m\n"
  printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

  # foreground colors
  for fgc in {30..37}; do
    # background colors
    for bgc in {40..47}; do
      fgc=${fgc#37} # white
      bgc=${bgc#40} # black

      vals="${fgc:+$fgc;}${bgc}"
      vals=${vals%%;}

      seq0="${vals:+\e[${vals}m}"
      printf "  %-9s" "${seq0:-(default)}"
      printf " ${seq0}TEXT\e[m"
      printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
    done
    echo; echo
  done
}

source /usr/share/git/completion/git-prompt.sh

if ! pgrep ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval $(<~/.ssh-agent-thing)
fi
ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'

alias p="xclip -o"
alias x="xclip -i"

