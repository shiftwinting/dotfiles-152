
# ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
# ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
# ██████╔╝███████║███████╗███████║██████╔╝██║     
# ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
# ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
# ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

# source functions
. ~/.config/shell/scripts/shell_functions.sh
. ~/.config/shell/aliases/arch_aliases


#---------------------------------------------------------------
# options and settings

# default editor
export VISUAL=nvim
export EDITOR="$VISUAL"


# PATH
# trash-cli is located there
export PATH=~/.local/bin:"$PATH"


# history
export HISTFILE=~/.config/shell/shell_hist
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
prompt_top="\n${tlcorner_thin}${hline}${workingdir}"
prompt_bot="${blcorner}${hline}${arrow}"

# prompt
PS1="${prompt_top}${prompt_bot}" 


#---------------------------------------------------------------
# fzf

# enable autocompletion
[[ $- == *i* ]] && source "/home/j/.config/fzf/shell/completion.bash" 2> /dev/null


# enable key bindings
source "/home/j/.config/fzf/shell/key-bindings.bash"
 

#### fzf #### 
# include fzf in path
if [[ ! "$PATH" == */home/j/.config/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/j/.config/fzf/bin"
fi
 

# define default fzf operation
export FZF_DEFAULT_OPTS='--border --cycle --height 40% --layout=reverse --no-bold --padding 1,3
                         --color 'bg+:#d1d7de' --color 'fg+:#8e4585' --color 'hl:#d94e4e' --color 'hl+:#d94e4e' --color 'info:#000000''


# this assumes the default "find" tool 
# as the backend of fzf. In the future,
# we should try another backend tool which
# is considered faster
export FZF_DEFAULT_COMMAND='find / .'                                        
export FZF_CTRL_F_COMMAND='find ~ .'                                         
