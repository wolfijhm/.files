# theme based on
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/arrow.zsh-theme

autoload -Uz colors && colors

# show different color for root
if [ $UID -eq 0 ]; then
  USR="%{$fg[red]%}%n%{$reset_color%}"
else
  USR="%n"
fi

PROMPT="$USR@%{$fg[cyan]%}%M%{$reset_color%}:%~%{$fg[cyan]%}➤ %{$reset_color%}"
unset USR
