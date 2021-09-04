source "$HOME/.bashrc"

export GPG_TTY=$(tty)

export GIT_EDITOR=nvim
export LESS=-FRX

export PATH="$PATH:$HOME/.local/bin"

#
# Go
#
export GOPATH="$HOME/go"
export PATH="$PATH:/opt/go/go1.16.4/bin:$GOPATH/bin"

#
# Java
#
export JAVA_HOME="/usr/lib/jvm/default-java"
export PATH="$PATH:$JAVA_HOME/bin"

#
# NodeJS-related
#
export NODEJS_VERSION="v14.16.0"
export NODEJS_DISTRO="linux-x64"
export PATH="$PATH:/opt/nodejs/node-$NODEJS_VERSION-$NODEJS_DISTRO/bin"
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

#
# Ruby
#
export PATH="$PATH:$HOME/.rbenv/bin"
eval "$(rbenv init -)"

#
# Rust
#
source "$HOME/.cargo/env"

#
# PHaRLAP
#
export PHARLAP_HOME="/opt/pharlap_4.4.1"
export DIR_MODELS_REF_DAT="${PHARLAP_HOME}/dat"
