#!/usr/bin/env bash

OH_MY_ZSH="$HOME/.oh-my-zsh"
VUNDLE="$HOME/.vim/bundle/Vundle.vim"

echo -e "Usage: bootstrap.sh [-b | -f]
Were:
-b means backup original files
-f means force install\n"

if [ ! -z "$1" ] && [ "$1" = "-b" ]; then
	echo "Using backup-feature. Look for *_ORIGINAL-files in ~"
	BACKUP="--backup --suffix=_ORIGINAL"
else
	BACKUP=""
fi

cd "$(dirname "${BASH_SOURCE}")"
git pull origin master

function doIt() {
	rsync $BACKUP --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" --exclude ".gitmodules" \
		--exclude "differ.sh" \
		-av --no-perms . ~

	if [ ! -d "$OH_MY_ZSH" ]; then
		read -p "Could not find oh-my-zsh, do you want it installed? (y/n): " -n 1
		echo
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			git clone git://github.com/robbyrussell/oh-my-zsh.git $OH_MY_ZSH
		fi
	fi

	if [ ! -d "$VUNDLE" ]; then
		read -p "Could not find vundle, do you want it installed? (y/n): " -n 1
		echo
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			git clone https://github.com/gmarik/Vundle.vim.git $VUNDLE
		fi
	fi

	source ~/.zshrc
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
