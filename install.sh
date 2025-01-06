#!/bin/bash

CONFIG_DIR="$HOME/.config"
GHOSTTY_DIR="$CONFIG_DIR/ghostty"
GHOSTTY_CONFIG="$GHOSTTY_DIR/config"
TMUX_CONFIG="$HOME/.tmux.conf"

copy_ghostty_config() {
    echo "Copying ghostty config file..."
    cp "./ghostty/config" "$GHOSTTY_CONFIG"
}

copy_tmux_config() {
    echo "Copying tmux config file..."
    cp "./tmux/config" "$TMUX_CONFIG"
}

echo "Creating ghostty config directory..."
mkdir -p $GHOSTTY_DIR

# ghostty
if [ ! -f "$GHOSTTY_CONFIG" ]; then
    copy_ghostty_config
else
    echo "Ghostty config file already exists. Do you want to overwrite it? (y/n)"
    read -r response
    if [ "$response" = "y" ]; then
        copy_ghostty_config
    else
        echo "Ghostty config exists. No changes made."
    fi
fi


# tmux
if [ ! -f "$TMUX_CONFIG" ]; then
    copy_tmux_config
else
    echo "Tmux config file already exists. Do you want to overwrite it? (y/n)"
    read -r response
    if [ "$response" = "y" ]; then
        copy_tmux_config
    else
        echo "Tmux config exists. No changes made."
    fi
fi
