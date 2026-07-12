autoload -Uz compinit add-zsh-hook
compinit

if [ "$EUID" -eq 0 ]; then
  PROMPT='%F{red}[root]%f %F{244}%~%f # '
else
  PROMPT='%F{blue}%~%f $ '
fi
RPROMPT='%F{244}%*%f'

export PATH=/data/local/bin:/data/data/com.termux/files/usr/bin:/system/bin:/system/xbin:$PATH
export TERM=xterm-256color
export EDITOR=nano

HISTFILE=$HOME/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory sharehistory histignorealldups inc_append_history

alias ll='ls -la'
alias l='ls -CF'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias nano='nano +'
alias update='pkg update && pkg upgrade -y'
alias clean='pkg clean'

arch_mask() { "$@" 2>&1 | sed -E 's/armv[5678]l/arm/g; s/armeabi(-v[57]a)?/arm/g; s/armhf/arm/g'; }

my_preexec() { BUFFER_ORIG="$1"; }
add-zsh-hook preexec my_preexec

my_precmd() {
  local trimmed="${BUFFER_ORIG#"${BUFFER_ORIG%%[![:space:]]*}"}"
  trimmed="${trimmed%"${trimmed##*[![:space:]]}"}"
  if [[ -n "$trimmed" && "${trimmed:0:1}" != "#" ]]; then
    print -sr -- "$BUFFER_ORIG"
  fi
}
add-zsh-hook precmd my_precmd

clean_history() {
  [ -f "$HISTFILE" ] || return
  awk '!x[$0]++' "$HISTFILE" > "${HISTFILE}.tmp" && mv -f "${HISTFILE}.tmp" "$HISTFILE"
}
add-zsh-hook precmd clean_history

zle_line_init_func() { [[ -n "$BUFFER" ]] && CURSOR=${#BUFFER}; }
zle -N zle-line-init zle_line_init_func

bindkey -e
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^U' backward-kill-line

reload_zsh() { source ~/.zshrc; }
cdf() { cd "$1" && ls; }

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
export PATH=~/bin:$PATH
