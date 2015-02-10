#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

if [ -r /etc/bashrc ]; then
	source /etc/bashrc
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{git-prompt.sh,path,bash_prompt,exports,aliases,functions,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

if [ -r /usr/share/git/completion/git-completion.bash ]; then
	source /usr/share/git/completion/git-completion.bash
elif [ -r ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi

export PS1='\[\e[G\][\A|$?]\[\e[1m\]\u@\h\[\e[0m\]:\W$(__git_ps1 " (%s)")\$ '

export PATH=/home/fredrik/.gem/ruby/2.1.0/bin:/usr/local/heroku/bin:~/bin:$PATH

export EDITOR="vim"
