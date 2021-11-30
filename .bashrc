# bashrc


#---------------------------------------------------------------
# temp external sources



#---------------------------------------------------------------
# prompt

# colors
branch_bg='21;24;28'
branch_fg='0;0' # black
branch_col='\033[0;38;${branch_fg};48;2;${branch_bg}m'
txtrst='\033[0m'

color_branch="${branch_col} ${branch} ${txtrst}"
prompt_top="\n\w   ${color_branch}\n"
prompt_bot="» "


# prompt
PS1="${prompt_top}${prompt_bot}"




#---------------------------------------------------------------
# permanent external sources
CONF="/home/m/.config"

. $CONF/shell/scripts/mmv.sh
. $CONF/shell/scripts/shell_functions.sh
. $CONF/shell/aliases/aliases.sh




#---------------------------------------------------------------
# options and settings

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

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# turn off flow control
stty -ixon
