#!/bin/bash

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

[ -f "$HOME/.asdf/asdf.sh" ] && source "$HOME/.asdf/asdf.sh"

[ -f "$HOME/.asdf/completions/asdf.bash" ] && source "$HOME/.asdf/completions/asdf.bash"

export JAVA_HOME='/usr/lib/jvm/java-21-openjdk-amd64'

export TOMCAT_HOME='/opt/tomcat'

export PATH="$PATH:/usr/games:/usr/local/games:/snap/bin"

export PATH="~/.config/composer/vendor/bin:$PATH"

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

export FZF_DEFAULT_COMMAND=''

export FZF_CTRL_T_COMMAND=''

export TERMINAL=kitty

export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8

export EDITOR='vim'
