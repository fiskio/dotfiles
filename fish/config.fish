# PATH
set -gx PATH $HOME/.bin $PATH
set -gx PATH $PATH $HOME/torch/install/bin
set -gx PATH $PATH $HOME/wmt15/mosesdecoder/scripts/tokenizer
set -gx PATH $PATH $HOME/Library/Android/sdk/platform-tools
set -gx PATH $PATH $HOME/Library/Android/sdk/tools
set -gx PATH $PATH $HOME/Documents/android-ndk-r10e

# LUA
set -gx LUA_PATH $HOME/?/init.lua $HOME/?.lua $LUA_PATH
set -gx LUA_CPATH $HOME/oxnn/?.so $HOME/?.so $LUA_CPATH

# GCC
set -gx CC   /usr/local/bin/gcc-4.9
set -gx CXX  /usr/local/bin/g++-4.9

# VIM
#fish_vi_mode

# Aliases
alias zc 'gunzip -c -d'
alias ll 'ls -lart'

# if gshuf we are in OSX -> alias
if type -f gshuf >/dev/null ^/dev/null
   alias shuf gshuf
end

# GPG
set -gx GPG_TTY (tty)
cat ~/.gpg-agent-info | sed 's/=/ /' | while read key value
   set -e $key
   set -U -x $key "$value"
end
#echo $SSH_AUTH_SOCK
#echo $GPG_AGENT_INFO

# Greeting
function fish_greeting
   fortune -s  | fmt -80 -s | cowsay -(shuf -n 1 -e b d g p s t w y) -f (shuf -n 1 -e (cowsay -l | tail -n +2 | tr ' ' '\n')) -n
end

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps
# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'
