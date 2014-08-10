
.PHONY: all git symlink update clean

SETUP=./setup

all: git symlink

git:
	git submodule init
	git submodule update

symlink:
	@$(SETUP) `pwd` hookdotfiles

update: git
	git submodule foreach 'git checkout master && git pull'
	git commit --all --edit --message 'update git submodules'

clean:
	@$(SETUP) `pwd` unlink
