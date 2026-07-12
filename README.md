# ZSH Auto Configure - Custom Termux Shell

One-command custom ZSH setup with plugins.

## Quick Install
curl -sL https://raw.githubusercontent.com/frontenrahan/ZSH_Termux/main/setup.sh | bash

## Manual Install (deb)
pkg install ./zshauto_1.0.0_all.deb

## Included
- zsh-syntax-highlighting (basic or fast)
- zsh-autosuggestions
- fast-highlight
- basic-highlight
- Custom .zshrc

## Reinstall
pkg install --reinstall ./zshauto_1.0.0_all.deb

## Remove
pkg uninstall zshauto

## After Install
exec zsh
