#!/bin/bash

################################################################################
# Installation script for dot_files
# 
# This script automates the setup of dotfiles by creating symbolic links
# from this repository to your home directory.
#
# Usage: ./install.sh
################################################################################

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
SYMLINKS=(
    ".bashrc_yk:bash/.bashrc_yk"
    ".bash_aliases:bash/.bash_aliases"
    ".bash_logout:bash/.bash_logout"
    ".gitconfig:git/.gitconfig"
)

################################################################################
# Helper Functions
################################################################################

print_header() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}================================${NC}"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

backup_existing() {
    local target=$1
    if [ -e "$target" ]; then
        mkdir -p "$BACKUP_DIR"
        mv "$target" "$BACKUP_DIR/"
        print_warning "Backed up existing \\$(basename $target) to $BACKUP_DIR"
    fi
}

create_symlink() {
    local source_path=$1
    local target_path=$2
    local source_full="$SCRIPT_DIR/$source_path"
    
    if [ ! -e "$source_full" ]; then
        print_error "Source file not found: $source_full"
        return 1
    fi
    
    # Backup existing file
    backup_existing "$target_path"
    
    # Create symlink
    ln -s "$source_full" "$target_path"
    print_success "Symlinked \\$(basename $target_path)"
}

################################################################################
# Main Installation
################################################################################

main() {
    print_header "Dot Files Installation"
    
    print_info "Script directory: $SCRIPT_DIR"
    print_info "Home directory: $HOME"
    echo ""
    
    # Check if running from the correct directory
    if [ ! -f "$SCRIPT_DIR/install.sh" ]; then
        print_error "This script must be run from the dot_files repository root directory"
        exit 1
    fi
    
    # Create directory structure if it doesn't exist
    print_info "Checking directory structure..."
    mkdir -p "$SCRIPT_DIR/bash"
    mkdir -p "$SCRIPT_DIR/git"
    mkdir -p "$SCRIPT_DIR/brew"
    
    # Create symlinks
    print_header "Creating Symbolic Links"
    
    for link_spec in "${SYMLINKS[@]}"; do
        IFS=':' read -r target source <<< "$link_spec"
        create_symlink "$source" "$HOME/$target" || {
            print_error "Failed to create symlink for $target"
            continue
        }
    done
    
    echo ""
    
    # Source bashrc configuration
    print_header "Finalizing Setup"
    
    # Check if .bashrc_yk is sourced in ~/.bashrc
    if [ -f "$HOME/.bashrc" ]; then
        if grep -q 'source.*\.bashrc_yk' "$HOME/.bashrc" 2>/dev/null; then
            print_success "~/.bashrc_yk is already sourced in ~/.bashrc"
        else
            print_warning "~/.bashrc_yk is not sourced in ~/.bashrc"
            echo ""
            print_info "Add the following to your ~/.bashrc:"
            echo ""
            echo "    # Source custom bash configuration"
            echo "    if [ -f ~/.bashrc_yk ]; then"
            echo "        source ~/.bashrc_yk"
            echo "    fi"
            echo ""
            echo "    if [ -f ~/.bash_aliases ]; then"
            echo "        source ~/.bash_aliases"
            echo "    fi"
            echo ""
        fi
    fi
    
    # Homebrew setup instructions
    if [ -f "$SCRIPT_DIR/brew/Brewfile" ]; then
        echo ""
        print_info "To install Homebrew packages (macOS only):"
        echo "    brew bundle --file=$SCRIPT_DIR/brew/Brewfile"
    fi
    
    echo ""
    
    # Completion message
    if [ -d "$BACKUP_DIR" ]; then
        print_success "Installation complete! Backups saved to: $BACKUP_DIR"
    else
        print_success "Installation complete!"
    fi
    
    print_info "Reload your shell or run: source ~/.bashrc_yk"
}

# Run main function
main "$@"