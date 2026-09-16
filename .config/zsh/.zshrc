HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY


source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--height 44% --layout=reverse --border'


setopt NO_FLOW_CONTROL
setopt NUMERIC_GLOB_SORT
setopt INTERACTIVE_COMMENTS


autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

autoload -U edit-command-line
zle -N edit-command-line

autoload -Uz run-help

bindkey -v
bindkey '^H' run-help
# [Ctrl-RigthArrow/LeftArrow]
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '\C-x\C-e' edit-command-line
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

bindkey -s '' 'tmux-sessionizer\n'


alias l='ls -lah'
alias ls='ls --color=auto'
alias help=run-help


autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors di=34 ln=35 ex=32
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
