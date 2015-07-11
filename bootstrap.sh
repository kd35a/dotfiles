#!/bin/sh

OH_MY_ZSH="$HOME/.oh-my-zsh"
VUNDLE="$HOME/.vim/bundle/vundle"

echo "Usage: bootstrap.sh [-b | -f]
Were:
-b means backup original files
-f means force install
"

if [ ! -z "$1" ] && [ "$1" = "-b" ]; then
	echo "Using backup-feature. Look for *_ORIGINAL-files in ~"
	BACKUP="--backup --suffix=_ORIGINAL"
else
	BACKUP=""
fi

cd "$(dirname "${BASH_SOURCE}")"
git pull origin master

doIt() {
	rsync $BACKUP --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" --exclude ".gitmodules" \
		--exclude "differ.sh" \
		-av --no-perms . ~

	if [ ! -d "$OH_MY_ZSH" ]; then
		echo "Could not find oh-my-zsh, do you want it installed? (y/n): \c"
		read REPLY
		case $REPLY in
		[Yy]*)
			git clone git://github.com/robbyrussell/oh-my-zsh.git "$OH_MY_ZSH"
			;;
		*)
			;;
		esac
	fi

	if [ ! -d "$VUNDLE" ]; then
		echo "Could not find vundle, do you want it installed? (y/n): \c"
		read REPLY
		case $REPLY in
		[Yy]*)
			git clone https://github.com/gmarik/Vundle.vim.git "$VUNDLE"
			;;
		*)
			;;
		esac
	fi

	vim -c "execute \"PluginInstall\" | qa"
}
if [ "$1" = "--force" -o "$1" = "-f" ]; then
	doIt
else
	echo "This may overwrite existing files in your home directory. Are you sure? (y/n) \c"
	read REPLY
	case $REPLY in
	[Yy]*)
		doIt
		;;
	*)
		;;
	esac
fi
unset doIt
