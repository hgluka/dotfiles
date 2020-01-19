# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export TEXMFHOME=$XDG_DATA_HOME/texmf
export ALSA_CARD=Generic

export PATH="$XDG_BIN_HOME:$PATH"
exec fish
