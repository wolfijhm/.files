# based on
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh

git_updateprompt() {
  local ref prefix suffix color clean_color dirty_color
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  ref=${ref#refs/heads/}

  prefix="<git:"
  suffix=">"
  clean_color="cyan"
  dirty_color="yellow"
  untracked_color="red"

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    color="$untracked_color"
  elif [[ -n $(git status -s 2> /dev/null) ]]; then
    color="$dirty_color"
  else
    color="$clean_color"
  fi
  RPROMPT+="%{$fg[$color]%}$prefix$ref$suffix%{$reset_color%}"
}

add-zsh-hook precmd git_updateprompt
