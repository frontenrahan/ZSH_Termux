autoload -Uz compinit && compinit

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory sharehistory histignorealldups inc_append_history interactivecomments

if [ "$EUID" -eq 0 ]; then
    PROMPT='%F{red}[root]%f %F{244}%~%f # '
else
    PROMPT='%F{blue}%~%f $ '
fi
RPROMPT='%F{244}%*%f'

export PATH=/data/local/bin:$PREFIX/bin:/system/bin:/system/xbin:$HOME/bin:$PATH
export EDITOR=nano
export TERM=xterm-256color

alias ll='ls -la'
alias l='ls -CF'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias nano='nano +'
alias update='pkg update && pkg upgrade -y'
alias clean='pkg clean'
alias reload='source ~/.zshrc'

cdf() { cd "$1" && ls; }

bindkey -e
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^U' backward-kill-line

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

ZSH_PLUGIN_DIR=$HOME/.zsh-plugins
if [ -f "$ZSH_PLUGIN_DIR/zsh-autosuggestions.zsh" ]; then
    source "$ZSH_PLUGIN_DIR/zsh-autosuggestions.zsh"
    bindkey '^ ' autosuggest-accept 2>/dev/null || true
fi
if [ -f "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting-fast.zsh" ]; then
    source "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting-fast.zsh"
elif [ -f "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting-basic.zsh" ]; then
    source "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting-basic.zsh"
fi
