# .files
## Installation

```
$ cd ~
$ git clone https://github.com/ystein/.files
$ cd .files
$ make
File already exists: /home/ystein/.zshenv, what do you want to do?
[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all
$ B
```

The repository has to be cloned directly into the home directory.
The makefile will hook the dotfiles into the system using symlinks.
Conflicting dotfiles can either be overwritten (option ```O```) or renamed
to &lt;dotfile&gt;.bak (option ```B```).

## Topic Directory
All dotfiles are grouped by their purposes into topic specific directories.
Each of those directories can have

* a file named  _alias.conf_ for topic specific aliases (e.g.
  ```py``` for ```python```) [[code]](https://github.com/ystein/.files/blob/dev-profile/zsh/zshrc.symlink#L21)
* a file named _env.conf_ for topic specific environment variables
  (e.g. to set ```SVN_EDITOR```) [[code]](https://github.com/ystein/.files/blob/dev-profile/zsh/zshenv.symlink#L7)
* multiple files with a _.zsh_ suffix to configure zsh (e.g. to display the
current git branch in the prompt) [[code]](https://github.com/ystein/.files/blob/dev-profile/zsh/zshrc.symlink#L24)
* multiple files with a _.zshcompl_ suffix to configure the zsh completion
  [[code]](https://github.com/ystein/.files/blob/dev-profile/zsh/zshrc.symlink#L18)
* a directory named _bin_ for topic specific scripts [[code]](https://github.com/ystein/.files/blob/dev-profile/zsh/zshenv.symlink#L4)

See also [Advanced](#advanced) for further tweaks.

## Theme
![preview](https://raw.github.com/ystein/.files/master/preview.png)

## Aliases
See the ```alias.conf``` files in the topic directories.

## Advanced
### Link Algorithm
The rakefile performs the following steps for each file or directory in
```~/.files``` that has a .symlink suffix:

1. Strip the path to the topic directory.

  Prepend the path with a '.' (we're dealing with dotfiles, right?) and remove the
  .symlink suffix.

  Use this as the relative path starting from the home directory. For example
  ```~/.files/git/vim/bundle/fugitive.symlink/```  becomes the target path ```~/.vim/bundle/fugitive```.

2. Check if all parent directories exist. If not create them.

3. Create the symlink.

Even vim plugins can be grouped by their purposes with this method (as
in the example).

### Host Specific Configuration
Any content in ```~/.localrc``` and ```~/.localenv``` will be sourced last in
[.zshrc](https://github.com/ystein/.files/blob/dev-profile/zsh/zshrc.symlink#L27) and
[.zshenv](https://github.com/ystein/.files/blob/dev-profile/zsh/zshenv.symlink#L10), respectively.
This way you can overwrite any configuration in the original files.
