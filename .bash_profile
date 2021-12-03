# ~/.bash_profile configures user environment on login

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ $(fgconsole 2> /dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null
