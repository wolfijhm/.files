all: git symlink

git:
	git submodule init
	git submodule update

symlink:
	@./dotfiles `pwd` hookdotfiles

update: git
	git submodule foreach 'git checkout master && git pull'
	git commit --all --edit --message 'update git submodules'

clean:
	@./dotfiles `pwd` unlink
