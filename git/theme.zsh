# based on
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh

git_updateprompt() {
  local ref prefix suffix color clean_color dirty_color
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -z $ref ]]; then
    # check if we are in a git repository
    return
  fi
  ref=${ref#refs/heads/}

  prefix="<git:"
  suffix=">"
  untracked_color="red"
  dirty_color="yellow"
  clean_color="cyan"

  GIT_STATUS=$(git status -s)
  if [[ -n $(echo $GIT_STATUS | grep '??' 2> /dev/null) ]]; then
    color="$untracked_color"
  elif [[ -n $GIT_STATUS ]]; then
    color="$dirty_color"
  else
    color="$clean_color"
  fi
  RPROMPT+="%{$fg[$color]%}$prefix$ref$suffix%{$reset_color%}"
}

add-zsh-hook precmd git_updateprompt
