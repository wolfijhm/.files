bindkey -e

# del
bindkey "[3~" delete-char
# CTRL-a
bindkey "OH" beginning-of-line
# CTRL-e
bindkey "OF" end-of-line
# ALT-<Right>
bindkey ";5C" emacs-forward-word
bindkey "OC" emacs-forward-word
# ALT-<Left>
bindkey ";5D" emacs-backward-word
bindkey "OD" emacs-backward-word
# ALT-m
bindkey "m" copy-prev-shell-word

# CTRL-X_e
autoload edit-command-line && zle -N edit-command-line
bindkey "" edit-command-line

# from grml-zsh: CTRL-z
bindkey -s "" "fg\n"

# vim: ft=zsh
