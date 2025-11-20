# Nautilus IDE Extensions

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 🚀 Description

This repository contains Nautilus extensions to add context menu support for various IDEs, allowing you to open files and folders directly from your file explorer.

Supported IDEs:
- **Antigravity** (`antigravity`)
- **VS Code** (`code`)
- **Cursor** (`cursor`)
- **Windsurf** (`windsurf`)

This repository is based on the excellent work from [code-nautilus](https://github.com/harry-cpp/code-nautilus) by harry-cpp.

## 🎯 Features

- Right-click to open files in your favorite IDE
- Open entire folders
- Clean and modern integration with Nautilus

## 🛠️ Installation

To install the extension for your preferred IDE, run the corresponding command:

### Antigravity
```bash
wget -qO- https://raw.githubusercontent.com/RodrigoSaka/nautilus-ides/main/install.sh | bash -s -- antigravity
```

### VS Code
```bash
wget -qO- https://raw.githubusercontent.com/RodrigoSaka/nautilus-ides/main/install.sh | bash -s -- code
```

### Cursor
```bash
wget -qO- https://raw.githubusercontent.com/RodrigoSaka/nautilus-ides/main/install.sh | bash -s -- cursor
```

### Windsurf
```bash
wget -qO- https://raw.githubusercontent.com/RodrigoSaka/nautilus-ides/main/install.sh | bash -s -- windsurf
```

## 🗑️ Uninstallation

To uninstall, remove the specific script file and restart Nautilus.

Example for Windsurf:
```bash
rm -f ~/.local/share/nautilus-python/extensions/windsurf-nautilus.py
nautilus -q
```
(Replace `windsurf-nautilus.py` with `antigravity-nautilus.py`, `code-nautilus.py`, or `cursor-nautilus.py` as needed)

## 📦 Requirements

- Python Nautilus
- Your chosen IDE
- Nautilus file manager

## 📝 Usage

1. Right-click on any file to open it in the IDE
2. Right-click on a folder to open it in the IDE
3. Or right-click on empty space in a folder to open that folder in the IDE

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## 👥 Author

Created and maintained by Rodrigo Sakaguchi