#!/bin/bash

WAYBAR_DIR="$HOME/.config/waybar"
BACKUP_DIR="$HOME/.config/.waybar.bkup"

echo "    A Simple, Minimal Waybar Theme (By nagnagi ^-^)"
echo ""

mkdir -p "$WAYBAR_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
if [ -d "$WAYBAR_DIR" ]; then
    echo "Backing up existing config to: $BACKUP_DIR.$TIMESTAMP"
    cp -r "$WAYBAR_DIR" "$BACKUP_DIR.$TIMESTAMP"
    echo ""
fi

CONFIG_URL="https://raw.githubusercontent.com/nagnagi/simple-waybar/main/config.jsonc"
STYLE_URL="https://raw.githubusercontent.com/nagnagi/simple-waybar/main/style.css"

curl -s -o "$WAYBAR_DIR/config.jsonc" "$CONFIG_URL" || {
    echo "Error: Failed to download config file."
    exit 1
}

curl -s -o "$WAYBAR_DIR/style.css" "$STYLE_URL" || {
    echo "Error: Failed to download style.css file."
    exit 1
}

echo "Installation complete!"
echo "Restart Waybar to apply changes."

