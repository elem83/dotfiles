
alias sa='alias | egrep -i'
alias sz='source ~/.zshrc'
alias vi="/usr/local/bin/vim"

# ----------------------------------------------------------------------------
# Quick edit
# ----------------------------------------------------------------------------
#
alias ez='vi $HOME/.zshrc && source ~/.zshrc'
alias ev='/usr/local/bin/vim ~/.vimrc'
alias ek='vim /home/netsamir/dotfiles/oh-my-zsh/custom/key-bindings.zsh && source ~/.zshrc'
alias ea='vim /home/netsamir/dotfiles/oh-my-zsh/custom/alias.zsh && source ~/.zshrc'
alias ef='vim /home/netsamir/dotfiles/oh-my-zsh/custom/functions.zsh && source ~/.zshrc'


alias i='view ~/Documents/Vault/identity.txt'
alias ii='vi ~/Documents/Vault/identity.txt'

# ----------------------------------------------------------------------------
# Dictories
# ----------------------------------------------------------------------------
#
alias d='dirs -v | head -20'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias 10='cd -10'
alias 12='cd -12'
alias 13='cd -13'
alias 14='cd -14'
alias 15='cd -15'
alias 16='cd -16'
alias 17='cd -17'
alias 18='cd -18'
alias 19='cd -19'
alias 20='cd -20'

alias md='mkdir -p'
alias rd=rmdir

# ----------------------------------------------------------------------------
# List directory contents
# ----------------------------------------------------------------------------
#
alias l='ls -lFrh'    #size,show type,human readable, by date
alias ll='ls -lAFrth'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'
alias lc='ls --format=single-column'

# ----------------------------------------------------------------------------
# History
# ----------------------------------------------------------------------------
#
alias h='history'
alias hh='history | awk "{print \$2}" | sort | uniq -c |sort -rn | head -50'
alias hgrep="fc -El 0 | egrep"
alias sh='history| egrep'

# ----------------------------------------------------------------------------
# Debian
# ----------------------------------------------------------------------------
#
alias inst='sudo apt-get install'

# ----------------------------------------------------------------------------
# SSH
# ----------------------------------------------------------------------------
#
alias ssh-add='ssh-add ~/.ssh/id_rsa'
alias wf='ssh netsamir@web537.webfaction.com'

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# ----------------------------------------------------------------------------
# Utils
# ----------------------------------------------------------------------------

alias bc='bc -l'
alias g='egrep -iR'

alias -g gg='| egrep'
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g pp="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

#list whats inside packed file
alias -s zip="unzip -l"

alias t='tree'
alias p='pwd'
alias copy='xclip -sel clip'
alias -g yy='| xclip -sel clip'
alias cat='colorize_via_pygmentize'

alias del='gvfs-trash'
alias o='gvfs-open'

alias zxt='tar zxvf '
alias xt='tar xvf'

# ----------------------------------------------------------------------------
# Expressvpn
# ----------------------------------------------------------------------------
#
alias xc='expressvpn connect'
alias xd='expressvpn disconnect'
alias xs='expressvpn status'
alias xl='expressvpn list'

# ----------------------------------------------------------------------------
# Web Development
# ----------------------------------------------------------------------------
#
alias harp='harp server'

# ----------------------------------------------------------------------------
# Django
# ----------------------------------------------------------------------------
alias dj='python $DJ_CUR_PROJECT/manage.py'
alias djc='python $DJ_CUR_PROJECT/manage.py collectstatic'
alias djr='python $DJ_CUR_PROJECT/manage.py runserver'
alias djm='python $DJ_CUR_PROJECT/manage.py makemigrations && \
            python $DJ_CUR_PROJECT/manage.py migrate'
# ----------------------------------------------------------------------------
# Python
# ----------------------------------------------------------------------------
alias pips='sudo -H pip3'
alias ipy='/usr/local/bin/ipython --TerminalInteractiveShell.editing_mode=vi'

# ----------------------------------------------------------------------------
# Git
# ----------------------------------------------------------------------------
alias findgit='find ~/dotfiles -type f -exec egrep "git@git" {} \;'
