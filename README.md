<div align="center">

# 📂 dotfiles

## My personal configuration files for a productive and aesthetically pleasing development environment 🚀

</div>

<div align="center">

![Linux](https://img.shields.io/badge/OS-Linux-orange?style=for-the-badge&logo=linux&logoColor=white)
![Neovim](https://img.shields.io/badge/Editor-Neovim-green?style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Config-Lua-blueviolet?style=for-the-badge&logo=lua&logoColor=white)

</div>

<div align="center">

![License](https://img.shields.io/badge/License-MIT-brightgreen?style=flat-square)
![Status](https://img.shields.io/badge/Status-Maintained-informational?style=flat-square)

</div>

## 🚀 Overview

This repository contains my personal dotfiles. I aim for a setup that is efficient, keyboard-centric, and highly customizable. Most of my configurations are centered around the Neovim ecosystem to ensure a seamless transition between different machines.

## 🛠️ Managed Configurations

### 🌌 Neovim

My primary editor setup. It is built on top of [LazyVim](https://lazyvim.org/), providing a robust foundation with a curated set of plugins.

- **Plugin Manager**: `lazy.nvim`
- **Config Language**: Lua
- **Key Features**: Custom keymaps, optimized LSP settings, and specialized plugins for various languages.

### 🖼️ Neovide

The GUI frontend for Neovim. My configuration focuses on:

- Smooth animations and cursor effects.
- Optimized font rendering for a clean look.
- Integration with my Neovim config.

## 📦 Installation

To use these dotfiles, you can symlink them to your home directory.

```bash
# Clone the repository
git clone https://github.com/georgesnoe/dotfiles.git ~/dotfiles

# Example: Symlinking Neovim config
ln -s ~/dotfiles/nvim ~/.config/nvim

# Example: Symlinking Neovide config
ln -s ~/dotfiles/neovide ~/.config/neovide

# Example: Symlinking sqlfluff config
ln -s ~/dotfiles/sqlfluff ~/.config/sqlfluff
```

## 🔮 Future Additions

I plan to expand this repository to include:

- [ ] **Zsh/Bash**: Shell configurations and aliases.
- [ ] **Tmux**: Terminal multiplexer setup for better session management.
- [ ] **Git**: Global `.gitconfig` for consistent commit styles.
- [ ] **Terminal**: Configurations for Kitty or Alacritty.

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
