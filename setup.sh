#!/bin/sh

#
# Script for setting up my development environment
# Author: Carey Janecka <careyjanecka@gmail.com>
#
# USAGE
#
# $ ./setup.sh
#

#
# Colors
#

bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

green=$(tput setaf 2)
red=$(tput setaf 1)
yellow=$(tput setaf 3)
purple=$(tput setaf 5)
grey=$(tput setaf 242)
blue=$(tput setaf 14)

#
# Headers and logging
#

header() { 
  printf "\n${purple}============ ${bold}%s${reset}${purple} ============${reset}\n\n" "$@"
}

arrow() {
  printf "${bold}${yellow}➜${reset} $@\n"
}

success() {
  printf "${bold}${green}✔${reset} $@\n"
}

error() {
  printf "${bold}${red}✖${reset} $@\n"
}

#
# Helper functions
#

install() {
  if [ -f "$HOME/.$@" ] && [ ! -L "$HOME/.$@" ]; then
    arrow "Backing up existing ${blue}.$@${reset}"
    mv $HOME/.$@ $HOME/.$@.backup
  fi
  
  if [ -L "$HOME/.$@" ]; then
    arrow "Skipping ${blue}.$@ ${grey}(link already exists)${reset}"
  else 
    ln -s $PWD/$@ $HOME/.$@
    success "Successfully installed ${blue}.$@${reset}"
  fi
}

#
# Install dotfiles
#

header "Installing dotfiles"

install "zshrc"
install "vimrc"
install "hyper.js"
install "tmux.theme"
install "tmux.conf"
install "config/nvim"
install "oh-my-zsh/custom"

echo

