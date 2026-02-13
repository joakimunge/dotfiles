#!/bin/bash

# Dotfiles install script for macOS
# Creates symlinks from home directory to dotfiles

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR"

# Create backup directory
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Function to create symlink with backup
link_file() {
    local src="$1"
    local dest="$2"
    
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Backing up existing $dest"
        mv "$dest" "$BACKUP_DIR/"
    fi
    
    echo "Linking $src -> $dest"
    ln -sf "$src" "$dest"
}

# Neovim
mkdir -p "$HOME/.config"
link_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Zsh
link_file "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"

# Git
link_file "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
mkdir -p "$HOME/.config/git"
link_file "$DOTFILES_DIR/git/ignore" "$HOME/.config/git/ignore"

echo ""
echo "Done! Backups saved to $BACKUP_DIR"
echo "Restart your terminal or run 'source ~/.zshrc' to apply changes."
