#!/bin/bash

source "$(dirname "$0")/common.sh"

get_ide_selection "Select an IDE to install:"

check_root

echo -e "${GREEN}Selected IDE: $IDE${NC}"
echo ""

# Verify python-nautilus instalation
if python3 -c "import gi; from gi.repository import Nautilus" 2> /dev/null ; then
    echo -e "${GREEN}python-nautilus is installed${NC}"
else
    echo -e "${RED}Error: python-nautilus is not installed${NC}"
    exit 1
fi
echo ""

# Remove previous version and setup folder
echo -e "${BLUE}Removing previous version (if found)...${NC}"
mkdir -p ~/.local/share/nautilus-python/extensions
rm -f ~/.local/share/nautilus-python/extensions/$SCRIPT_NAME
echo ""

# Download and install the extension
echo -e "${BLUE}Downloading newest version for $IDE...${NC}"
# Verify if the installation was successful
if wget -q -O ~/.local/share/nautilus-python/extensions/$SCRIPT_NAME https://raw.githubusercontent.com/RodrigoSaka/nautilus-ides/main/scripts/$SCRIPT_NAME ; then
    echo -e "${GREEN}Download completed successfully.${NC}"
else
    echo -e "${RED}Download failed.${NC}"
    exit 1
fi
echo ""

# Restart nautilus
echo -e "${BLUE}Restarting nautilus...${NC}"
nautilus -q > /dev/null 2>&1
echo ""

echo -e "${GREEN}Installation Complete for $IDE${NC}"
