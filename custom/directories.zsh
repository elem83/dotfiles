# ----------------------------------------------------------------------------
# Pushd
# ----------------------------------------------------------------------------
#
# http://zsh.sourceforge.net/Intro/intro_6.html
# we can get something like a directory history
DIRSTACKSIZE=20
setopt auto_pushd
setopt pushd_minus
setopt pushd_silent             # no dir stack after pushd or popd
setopt pushd_to_home            # `pushd` = `pushd $HOME`

setopt pushd_ignore_dups        # no duplicates in dir stack

#  CDABLE_VARS (-T): If the argument to a cd command (or an implied cd with the AUTO_CD option set) is not a directory, and does not begin with a slash, try to expand the expression as if it were preceded by a `~' (see the section `Filename Expansion').
setopt cdable_vars
setopt chase_links
#   CHASE_LINKS (-w): Resolve symbolic links to their true values when changing directory.  This also has the effect of CHASE_DOTS, i.e. a `..' path segment will be treated as referring to the physical parent, even if the preceding path seg‐ ment is a symbolic link.

