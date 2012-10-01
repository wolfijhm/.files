HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory
setopt hist_ignore_all_dups

DIRSTACKSIZE=8
# use pushd instead of cd
setopt autopushd
# ignore duplicates in the directory history
setopt pushdignoredups
# print no message
setopt pushdsilent
# invert meaning of + and - (highest element in the stack hast highest order)
setopt pushdminus
# push directories relative to home dir
setopt pushdtohome
