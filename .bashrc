# bashrc

#---------------------------------------------------------------
# prompt

prompt_top="\n\w\n"
prompt_bot="» "

PS1="${prompt_top}${prompt_bot}"




#---------------------------------------------------------------
# permanent external sources
TOOLS="/home/m/.config/shell"

. $TOOLS/scripts/mmv.sh
. $TOOLS/scripts/shell_functions.sh
. $TOOLS/aliases/aliases.sh

# source external tools whose configurations
# we want elsewhere, such as fzf
. $TOOLS/external_tools.sh




#---------------------------------------------------------------
# options and settings

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# turn off flow control
stty -ixon

# shell options
shopt -s checkwinsize
shopt -s extglob
shopt -s histappend

# history
export HISTFILE=~/.cache/bash_history
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=
export HISTFILESIZE=
export HISTTIMEFORMAT="%D  %I:%M:%S%P:  "

PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# default editor
export VISUAL=nvim
export EDITOR="$VISUAL"
