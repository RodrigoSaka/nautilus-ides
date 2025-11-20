#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Interactive selection
get_ide_selection() {
    local arg_ide=$1
    local prompt_msg=$2

    if [ -n "$arg_ide" ]; then
        IDE=$arg_ide
    else
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
    fi

    # Validate IDE
    case $IDE in
        antigravity|code|cursor|windsurf)
            # Valid
            ;;
        *)
            echo -e "${RED}Error: Invalid IDE specified '$IDE'.${NC}"
            echo -e "${YELLOW}Supported IDEs: antigravity, code, cursor, windsurf${NC}"
            exit 1
            ;;
    esac

    SCRIPT_NAME="${IDE}-nautilus.py"
}
