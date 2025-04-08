# NeoVim Configuration

## ⚙️ Install NeoVim (at least version 0.1.0)
```bash
# Clone Repo
git clone https://github.com/neovim/neovim.git
cd neovim

# Build from source with Cmake
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```
## Install Requirements
```bash
# Install colorscript for dashboard coloring
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts
sudo make install

# Install Copilot
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
```
Start Vim/Neovim and invoke :Copilot setup

### Nerdfonts for fonts and icons
[Nerdfonts](https://www.nerdfonts.com/)

## Custom Configuration & Settings
```bash
git clone https://github.com/derekgreene11/nvim.git ~/.config/nvim && nvim
```
