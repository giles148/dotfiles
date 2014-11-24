FILES = aliases gitconfig profile vim vimrc zsh zshrc
#note need to update to include configs for non vim
all:
	git submodule init
	git submodule update
	@echo
	@for file in $(FILES); do \
		echo "Symlink: `pwd`/$$file => $(HOME)/.$$file" ; \
		ln -sf `pwd`/$$file $(HOME)/.$$file ; \
	done

