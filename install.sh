#!/bin/sh

CONFIG_PATH="$HOME/.config/awesome"
REPOSITORY="https://github.com/shelepuginivan/awesome.git"

# Check if there is an existing configuration
if [ -d "$CONFIG_PATH" ]; then
    echo "Found existing configuration!"
    echo "Backing up to $CONFIG_PATH.bak..."
    mv "$CONFIG_PATH" "$CONFIG_PATH.bak"
    echo "Done!"
fi

echo "Cloning the repository..."
git clone --depth 1 "$REPOSITORY" "$CONFIG_PATH"

echo "Installation compete!"
echo "Press Ctrl + Super + r to reload awesome"
