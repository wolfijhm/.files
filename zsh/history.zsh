HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory
setopt hist_ignore_all_dups

DIRSTACKSIZE=8
setopt autopushd # use pushd instead of cd
setopt pushdignoredups # ignore duplicates in the directory history
setopt pushdsilent # print no message
setopt pushdtohome
