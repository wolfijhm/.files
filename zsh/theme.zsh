# theme based on
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/arrow.zsh-theme

autoload -Uz colors && colors

update_prompt() {
  local usr
  # show a different color for root
  if [ $UID -eq 0 ]; then
    usr="%{$fg[red]%}%n%{$reset_color%}"
  else
    usr="%n"
  fi

  PROMPT="%(?..%{$fg[red]%}[%?]%{$reset_color%} )$usr@%{$fg[cyan]%}%m%{$reset_color%}:%~%{$fg[cyan]%}➤ %{$reset_color%}"
}

add-zsh-hook precmd update_prompt
