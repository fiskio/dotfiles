# ~/.bashrc: executed by bash(1) for non-login shells
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

# ALIASES
alias allSKTest='ant clean test -Dproducts=Test_SwiftKey'

# EXPORTS
export PATH=$PATH:/home/fiskio/Documents/scala-2.9.0.1/bin
#export PATH=$PATH:~/Documents/adt-bundle-linux-x86_64-20130522/sdk/platform-tools
#export PATH=$PATH:~/Documents/adt-bundle-linux-x86_64-20130522/sdk/tools
export PATH=$PATH:~/android-sdk-linux/platform-tools
export PATH=$PATH:~/android-sdk-linux/tools

alias dst='pidcat.py com.touchtype.swiftkey.phone.trial'
alias pushExt='adb push /tmp/trialext.dat /data/data/com.touchtype.swiftkey.phone.trial/files/trialext.dat'

export STUDIO_JDK=/opt/java/64/jre1.7.0_40/bin/java
export JAVA8_HOME=/usr/lib/jvm/java-8-oracle/jre/bin/java
export PATH=/home/fiskio/Documents/SCALA/sbt/bin:$PATH

export NUPIC=/home/fiskio/GIT/nupic
export NTA=$NUPIC/build/release
export NTA_ROOTDIR=$NTA
export PYTHONPATH=$PYTHONPATH:$NTA/lib/python2.7/site-packages
export CEPT_APP_ID=0dd2419e
export CEPT_APP_KEY=d8e1a768647f50f3e067761c71fd26d1

export ANDROID_NDK_TOOLCHAIN_ROOT=/home/fiskio/android-ndk-r9d/
export PATH=$PATH:$ANDROID_NDK_TOOLCHAIN_ROOT

export LD_LIBRARY_PATH=/opt/OpenBLAS/lib/:/usr/lib/gcc-cross/arm-linux-gnueabihf/4.8.2
export CMAKE_LIBRARY_PATH=$LD_LIBRARY_PATH

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export ANDROID_HOME=/home/fiskio/android-sdk-linux
export PYTHONPATH=/usr/lib/python2.7/dist-packages

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export EDITOR='vim'

if which ruby >/dev/null && which gem >/dev/null; then
   PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

export TERM=screen-256color
export PATH=/home/fiskio/torch-local/bin:$PATH
export PATH=/home/fiskio/NN/TORCH/aws-ec2/aLM:$PATH
export LD_LIBRARY_PATH="/lib:/usr/lib:/usr/local/lib"
