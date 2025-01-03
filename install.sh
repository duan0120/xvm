#!/usr/bin/env bash

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: git is not installed. Please install git first."
    exit 1
fi

# Clone xvm repository
if [ -d "$HOME/.xvm" ]; then
    echo "Directory ~/.xvm already exists. Please remove it first."
    exit 1
fi

git clone https://github.com/duan0120/xvm.git "$HOME/.xvm"

# Detect current shell
current_shell=$(basename "$SHELL")

# Add environment variables to shell config files
add_to_shell_config() {
    local config_file="$1"
    local shell_name="$2"
    if [ -f "$config_file" ]; then
        if ! grep -q "export XVM_ROOT" "$config_file"; then
            echo "Adding XVM configuration to $config_file for $shell_name..."
            echo -e "\n# XVM" >> "$config_file"
            echo "export XVM_ROOT=~/.xvm" >> "$config_file"
            echo '[ -s "$XVM_ROOT/xvm" ] && . "$XVM_ROOT/xvm"' >> "$config_file"
        fi
    fi
}

# Configure based on detected shell
case "$current_shell" in
    "bash")
        add_to_shell_config "$HOME/.bashrc" "bash"
        ;;
    "zsh")
        add_to_shell_config "$HOME/.zshrc" "zsh"
        ;;
    *)
        echo "Warning: Unsupported shell detected ($current_shell)"
        add_to_shell_config "$HOME/.bashrc" "bash"
        add_to_shell_config "$HOME/.zshrc" "zsh"
        ;;
esac

echo -e "\nInstallation Summary:"
echo "------------------------"
echo "✓ XVM repository cloned to: $HOME/.xvm"
echo "✓ Environment variables configured"
echo "✓ Shell integration completed"
echo -e "\nTo activate XVM in current session:"
case "$current_shell" in
    "bash")
        echo "Run: source ~/.bashrc"
        source "$HOME/.bashrc"
        ;;
    "zsh")
        echo "Run: source ~/.zshrc"
        source "$HOME/.zshrc"
        ;;
    *)
        echo "Please run one of the following commands:"
        echo "  source ~/.bashrc  # for bash"
        echo "  source ~/.zshrc   # for zsh"
        ;;
esac

echo -e "\nXVM is now ready to use!"

