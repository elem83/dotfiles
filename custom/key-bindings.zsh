# ----------------------------------------------------------------------------
# Terminal
# ----------------------------------------------------------------------------

# vi bindings
bindkey -v
export KEYTIMEOUT=1

# Preferred editor for local and remote sessions
export EDITOR='vi'

# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
  zle &&  zle -R
}

zle -N zle-keymap-select

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

bindkey -s '' 'bindkey -L'
bindkey -s 'l' 'clear && ls -lFhs'
bindkey -s 'i' 'dirs -v'

bindkey -s ']' 'cd .. && clear && ls -lFhs'
bindkey -s '[' 'cd -'

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
# bindkey '^P' up-history
# bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
# bindkey '^h' backward-delete-char
# bindkey '^w' backward-kill-word

# allow ctrl-r to perform backward search in history
# bindkey '^r' history-incremental-search-backward

# allow ctrl-a and ctrl-e to move to beginning/end of line
# bindkey '^a' beginning-of-line
# bindkey '^e' end-of-line

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi

