# .files
## Installation

```
$ cd ~
$ git clone https://github.com/ystein/.files
$ cd .files
$ rake
File already exists: /home/ystein/.zshenv, what do you want to do?
[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all
$ B
```

The repository has to be cloned directly into the home directory.
The rakefile will hook the dotfiles into the system using symlinks.
Conflicting dotfiles can either be overwritten (option ```O```) or renamed
to &lt;dotfile&gt;.bak (option ```B```).

The branch _textedit-profile_ is basically a lightweight version of the dev
branch with fewer plugins and aliases.

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
![preview](https://github.com/ystein/.files/blob/textedit-profile/preview.png)

## Aliases
See the ```alias.conf``` files in the topic directories.

## Advanced
### Topic Specific Build Tasks
Each topic directory can contain a file named _rake.rb_
with topic specific build tasks during the installation (e.g. to compile a
vim plugin). These tasks have to start with ```build_```.
[[code]](https://github.com/ystein/.files/blob/dev-profile/Rakefile#L5-7)

### Link Algorithm
The rakefile performs the following steps for each file or directory in
```~/.files``` that has a .symlink suffix:

1. Strip the path to the topic directory.

  Prepend the path with a '.' (We're dealing with dotfiles, right?) and remove the
  .symlink suffix.

  Use this as the relative path starting from the home directory. For example
  ```~/.files/git/vim/bundle/fugitive.symlink/```  becomes the target path ```~/.vim/bundle/fugitive```.

2. Check if all parent directories exist. If not create them.

3. Create the symlink.

Even vim plugins can be grouped by their purposes with this method (as
in the example).

### Host Specific Configuration
Sometimes, due to different versions, config files can't
directly be shared between different hosts.
To automate the dirty handwork you can either write local configuration files or
patches:

#### Local Configuration Files
Any content in ```~/.localrc``` and ```~/.localenv``` will be sourced last in
[.zshrc](https://github.com/ystein/.files/blob/dev-profile/zsh/zshrc.symlink#L27) and
[.zshenv](https://github.com/ystein/.files/blob/dev-profile/zsh/zshenv.symlink#L10), respectively.
This way you can overwrite any configuration in the original files.

#### Patches
During installation, rake checks if the directory ```~/.files-patches``` exists.
If so, any file with a ```.path``` suffix in ```~/.files-patches``` is executed on its counterpart.
For example the script ```~/.files-patched/zsh/zshrc.symlink.patch``` will be
executed with ```~/.files/zsh/zshrc.symlink``` as its first argument.
[[code]](https://github.com/ystein/.files/blob/dev-profile/Rakefile#L22-31)
