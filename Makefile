
.PHONY: all git symlink update clean

all: git symlink

git:
	git submodule init
	git submodule update

symlink:
	@./scripts/bin/dotfiles `pwd` hookdotfiles

update: git
	git submodule foreach 'git checkout master && git pull'
	git commit --all --edit --message 'update git submodules'

clean:
	@./scripts/bin/dotfiles `pwd` unlink
