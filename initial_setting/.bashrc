# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#add by me

#mount -t cifs -o username=ta1se1,password=pasuwado1 //192.168.11.9/Share /mnt/windows

if [ -f ~/bin/shared ];then
	echo -n ''
else
	echo please_sharemount.
fi

#path
export PYTHONPATH="$HOME/bin/import/:$PYTHONPATH"
export PATH=$PATH:~/bin
export PATH=$PATH:~/bin/cdir
export PATH="$HOME/.linuxbrew/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
#----ruby----#
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
#export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
#------------#
#export PATH=$PATH:.

#auto cd ls
#cd() { builtin cd "$@" && ls -AGF; }

#bash color
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

usericon='?'
if test $USER = 'root';then
	usericon='#'
else
	usericon='$'
fi

if [ "$color_prompt" = yes ]; then
    USER_COLOR='\[\033[01;36m\]' # cyan
    cyan='\[\033[01;36m\]' # cyan
    HOST_COLOR='\[\033[01;31m\]' # red
    red='\[\033[01;31m\]' # red
    PWD_COLOR='\[\033[01;31m\]' # red
    black='\[\033[01;30m\]' # black
    RESET_COLOR='\[\033[00m\]'
    white='\[\033[00m\]'
	green='\033[02;32m'
    #PS1="${debian_chroot:+$debian_chroot)}${USER_COLOR}\u${HOST_COLOR}@\h:${PWD_COLOR}\w${RESET_COLOR}\$ "
    #PS1="${debian_chroot:+$debian_chroot)}${cyan}\u${red}@normal:${cyan}\w${white}\$ "
    #PS1="${debian_chroot:+$debian_chroot)}${cyan}\u${red}:\w${white}\n${usericon}"
    PS1="${debian_chroot:+$debian_chroot)}${cyan}\u${red}:\w${white}${usericon}"
fi
unset color_prompt force_color_prompt

#ここにsudは絶対に書くな

#alias python
alias pth='python'

#alias gdb
alias g='gdb -q -x core'

#alias cd
source ~/bin/cdir

#alias ls
alias lf='ls -CF'
alias dls='ls'
alias o='ols'
alias l='ols'
alias s='. s'
alias ls1='olsone'
alias l1='olsone'
alias s='ols'


#alias dvorak to jp
alias j='. j'
alias h='. h'
alias no='. no'

#alias jp to dvorak
alias d='source ~/.bashrc'
alias e='source ~/.bashrc'
alias p='source ~/.bashrc'

#alias rc
alias viba='vim ~/.bashrc'
alias soba='. ~/.bashrc'
alias vivi='vim /usr/share/vim/vimrc'



#gdb alias
alias altest='source al'

#xkb
xkbcomp -I$HOME/.xkb ~/.xkb/keymap/mykbd $DISPLAY 2> /dev/null

#alias objdump
alias objdump='objdump -M intel'

#alias diff
alias diff='diff -u'

#alias less
alias less='less -iMSR'

#alias gcc
alias gcc='gcc -I ~/bin/include/'

#virtualenv

### Virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

#alias docker ctf
alias cdock='docker run -v /home/miyagaw/ctf/:/root/ctf/ -it --name ctf ubuntu14i386 bash'
alias c2h='docker cp ctf:/root/ctf/ /home/miyagaw/'

#alias numcd
source ~/bin/numcd.alias

#export golang
export GOPATH=$HOME/go/thirdparty:$HOME/go/myproject
export PATH=$HOME/go/thirdparty/bin:$HOME/go/myproject/bin:$PATH
export GO15VENDOREXPERIMENT=1

#bind history
history_percol(){
	history | tac | percol | perl -pe 's/\d+\s+(.*)/\1/g' | /bin/bash
}
bind -x '"\C-h":history_percol' 

#alias cp
alias cp='cp -a'

#alias re
alias re='reboot'

#alias sd
alias sd='shutdown -h now'

#alias sud
alias sud='sudo bash'

#alias a
alias a='cd ../'

#alias xargs
alias to='xargs'
