# set tmux title to current directory

if [ -n "$TMUX" ]; then
  tmux_change_title() {
    printf '\033k'$(basename $(pwd))'\033\\'
  }

  add-zsh-hook precmd tmux_change_title
fi
