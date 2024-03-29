#!/bin/bash

# Load helper files.
for file in ~/.{aliases,functions,extras,exports}; do
  if [[ -r "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

# if [ "$color_prompt" = yes ]; then
#   PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(show_git_branch)\[\033[00m\]\$ '
# else
#   PS1='\u@\h:\w$(show_git_branch)\$ '
# fi
PS1='\$ '
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PS1="\\[\\e]0;${debian_chroot:+($debian_chroot)}\\u@\\h: \\w\\a\\]$PS1"
		;;
	*)
		;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	# shellcheck disable=SC2015
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# load rust/cargo environment
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# load rbenv if installed
if command -v rbenv &> /dev/null; then
	eval "$(rbenv init -)"
fi
