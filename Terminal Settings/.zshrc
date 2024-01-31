alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -la'
alias psag='ps auxww | grep'
alias pubip='curl icanhazip.com'
alias size='du -sh'
alias sui='sudo -i'
alias untar='tar -xzvf'

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
setopt PROMPT_SUBST
PROMPT="%K{white}%F{red}┌─[%F{black}%n%F{yellow}@%F{blue}%m%f%F{red}]─[%F{green}%d%F{red}]─[%F{cyan}%D{%D %L:%M:%S %p}%F{red}]\$(parse_git_branch)"$'\n'"└──╼ %F{yellow}$ %F{black}"
TMOUT=1
TRAPALRM() {
	zle reset-prompt
}

# ignores duplicated history entries when pressing up/down in terminal
setopt histignoredups
#set history size
export HISTSIZE=10000
#save history after logout
export SAVEHIST=10000
#history file
export HISTFILE=~/.zsh_history
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY

export GREP_COLORS='ms=01;31'

autoload -Uz compinit
compinit

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# https://stackoverflow.com/a/20277787
mem()
{
	ps -eo rss,pid,euser,args:100 --sort %mem | grep -v grep | grep -i $@ | awk '{printf $1/1024 "MB"; $1=""; print }'
}
