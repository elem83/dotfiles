cd-tab() {
    emulate -L zsh
    if [ $LBUFFER -eq ""]
    then
        LBUFFER="cd "
        zle list-choices
    fi
}
zle -N cd-tab
# bindkey '	' cd-tab
bindkey '' cd-tab
