# based on
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh

goto_gitroot() {
  [[ -d '.git' || $(pwd) == '/' ]] && return
  cd ..
  goto_gitroot
}

git_updateprompt() {
  local ref prefix suffix color clean_color dirty_color
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  ref=${ref#refs/heads/}

  [[ -z $ref ]] && return

  prefix="<git:"
  suffix=">"
  untracked_color="red"
  dirty_color="yellow"
  clean_color="cyan"

  if [[ -n $(goto_gitroot; git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    color="$untracked_color"
  elif [[ -n $(goto_gitroot; git status -s 2> /dev/null) ]]; then
    color="$dirty_color"
  else
    color="$clean_color"
  fi
  RPROMPT+="%{$fg[$color]%}$prefix$ref$suffix%{$reset_color%}"
}

add-zsh-hook precmd git_updateprompt
