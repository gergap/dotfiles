# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
#if [[ $- != *i* ]] ; then
#	# Shell is non-interactive.  Be done now!
#	return
#fi

export CC=gcc
export CXX=g++

export LD_LIBRARY_PATH=/usr/lib:/lib:/usr/local/lib:/opt/mspgcc/lib
export PATH=/opt/msp430-gcc-4.4.3/bin:/home/gergap/avr/bin:/usr/local/bin:$PATH
#export PATH=/opt/mspgcc/bin:/home/gergap/avr/bin:$PATH

# android SDK
export PATH=/home/gergap/android-sdk-linux_x86/platform-tools:/home/gergap/android-sdk-linux_x86/tools:$PATH


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

# My editor is vim of course
export EDITOR=/usr/bin/vim
export TERM=rxvt-unicode-256color
# load git bash completion
source /usr/share/bash-completion/completions/git
source /usr/share/git/git-prompt.sh
# Cool trick to show current git branch in the command prompt
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w$(__git_ps1 " (%s)") \$\[\033[00m\] '
# set english locale to get english error messages from compiler
export LANG=en_US.utf8

# make gnuplot happy to find arial
#export GDFONTPATH=/usr/share/fonts/corefonts
export GDFONTPATH=/usr/share/fonts/dejavu

# powerline
#source ~/work/opensource/powerline/powerline/bindings/bash/powerline.sh

# default role for streams which have no role e.g. KDE alsa stuff
export PULSE_PROP='media.role=music'

# desktop recording stuff
export PATH=~/Dropbox/videos:$PATH

# Add local search path for LaTeX
export TEXMFHOME="$HOME/.texmf"

# load my default aliases
source $HOME/dotfiles/aliases


# Euros
export EUROS_ROOT=/home/gergap/work/euros-cmake
export PATH=/home/gergap/work/qemu-linaro/arm-softmmu:$PATH

