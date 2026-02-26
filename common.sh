#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Verify if the user is root
check_root() {
    if [ $UID -eq 0 ]; then
        echo -e "${RED}Error: do not run this script as root${NC}"
        exit 1
    fi
}

# Interactive selection
get_ide_selection () {
    local prompt_msg=$1

    echo -e "${YELLOW}$prompt_msg${NC}"
    echo "1) antigravity"
    echo "2) code"
    echo "3) cursor"
    echo "4) windsurf"
    read -p "Enter choice [1-4]: " choice
    case $choice in
        1) IDE="antigravity" ;;
        2) IDE="code" ;;
        3) IDE="cursor" ;;
        4) IDE="windsurf" ;;
        *) echo -e "${RED}Invalid choice.${NC}"; exit 1 ;;
    esac

    SCRIPT_NAME="${IDE}-nautilus.py"
}

# Get IDE name by captalizing first letter 
get_ide_name () {
    local ide=$1

    IDE_NAME="${ide^}"
}
