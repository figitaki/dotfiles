#!/bin/sh
sudo apt update
sudo apt upgrade -y
sudo apt install -y zsh fzf ripgrep

# Install neovim
sudo snap install nvim --classic

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install eza

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir ~/.config

./setup.sh
