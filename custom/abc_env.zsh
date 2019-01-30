# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#

# ----------------------------------------------------------------------------
# System variables
# ----------------------------------------------------------------------------
#
export DEFAULT_USER="netsamir"

export PATH=$HOME/usr/bin:$HOME/local/bin:$HOME/.local/bin:$HOME/local/node-v9.5.0-linux-x64/bin:$PATH
export MANPATH=$HOME/usr/local/man:$MANPATH
export PERL5LIB=$HOME/local/lib64
export PYTHONSTARTUP=~/.pythonrc

# You may need to manually set your language environment
#
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Virtual env:
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=$HOME/.virtualenvs

# 20192501 - check a better way to work with the script : .env
# source ~/.autoenv/activate.sh

eval $(dircolors -b $HOME/.dircolors)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

chuck
