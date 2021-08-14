# bashrc

CONFIG="$HOME/.config"

. $CONFIG/shell/scripts/shell_functions.sh
. $CONFIG/shell/aliases
. $CONFIG/fzf/settings.sh


#---------------------------------------------------------------
# options and settings

# default editor
export VISUAL=nvim
export EDITOR="$VISUAL"


# history
export HISTFILE=$CONFIG/shell/shell_hist
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
#	    2) True color escape sequences:
#	        see https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences


# colors #
# Text Reset
txtrst='\[\e[0m\]'       

# Custom color
branch_bg='250;166;26'
branch_fg='5;0'
branch_col='\033[1;38;${branch_fg};48;2;${branch_bg}m'

# symbols #
#   see https://unicode-table.com/en/ 
#   for unicode characters. I can't 
#   find a list of the type of escape
#   sequences from below.
arrow='→ '
blcorner='\342\224\224'
hline='\342\224\200'
hnode='\342\225\274'
tlcorner_thin='\342\224\214'
tlcorner_thick='\342\224\215'

# prompt variables 
branch='$(git branch --show-current 2>/dev/null)'
colorized_branch="${branch_col} ${branch} ${txtrst}"
cur_dir=' \w  '
workingdir="${cur_dir}${colorized_branch}\n"
prompt_top="\n${tlcorner_thin}[${workingdir}"
prompt_bot="${blcorner}${hnode} "

# prompt
PS1="${prompt_top}${prompt_bot}" 

