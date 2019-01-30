export ZSH=/home/netsamir/dotfiles/oh-my-zsh

ZSH_THEME="gentoo"
DISABLE_AUTO_TITLE="true"

#-----------------------------------------------------------------------------
# Plugins
#-----------------------------------------------------------------------------
#
plugins=(cd-tab vi-mode git catimg chucknorris colorize django emoji emotty\
    encode64 extract gitignore dircycle dirpersist \
    per-directory-history history-substring-search colored-man-pages\
    copybuffer copydir copyfile debian virtualenvwrapper z ssh-agent)

zstyle :omz:plugins:ssh-agent agent-forwarding on

source $ZSH/oh-my-zsh.sh
