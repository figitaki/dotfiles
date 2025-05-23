#!/usr/bin/env bash

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install exa

# Install alacritty
brew install neovim alacritty zoxide fzf gcc@12 tmux lazygit

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0

# Run the univseral install script
./setup.sh
