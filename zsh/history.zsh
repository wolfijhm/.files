HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory

DIRSTACKSIZE=8
setopt autopushd # use pushd instead of cd
setopt pushdminus # -1 is the last accessed direcory
setopt pushdsilent # print no message
setopt pushdtohome
