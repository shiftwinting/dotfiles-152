# bashrc

CONF="$HOME/.config"

. $CONF/shell/scripts/shell_functions.sh
. $CONF/shell/aliases/aliases.sh
. $CONF/fzf/settings.sh


#---------------------------------------------------------------
# options and settings

# default editor
export VISUAL=nvim
export EDITOR="$VISUAL"


# history
export HISTFILE=$CONF/shell/shell_hist
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTTIMEFORMAT="%D  %I:%M:%S%P:  "


PROMPT_COMMAND="history -a;$PROMPT_COMMAND"


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# turn off flow control
stty -ixon

shopt -s checkwinsize
shopt -s extglob
shopt -s histappend


# prompt -------------------------------------------------------
#   docs:
#       1) Buggy bash history may be because of incorrectly escaped coloration
#           see: https://unix.stackexchange.com/questions/28827/why-is-my-bash-prompt-getting-bugged-when-i-browse-the-history
#       2) True color escape sequences:
#           see https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences

txtrst='\[\e[0m\]'

branch_bg='250;166;26'
branch_fg='5;0'
branch_col='\033[1;38;${branch_fg};48;2;${branch_bg}m'

branch='$(git branch --show-current 2>/dev/null)'
color_branch="${branch_col} ${branch} ${txtrst}"
prompt_top="\n\w   ${color_branch}\n"
prompt_bot='» '


# prompt
PS1="${prompt_top}${prompt_bot}"
