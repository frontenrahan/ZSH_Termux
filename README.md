# ZSH Auto Configure - Custom Termux Shell

One-command custom ZSH setup with plugins.

## Quick Install
```bash
curl -sL https://raw.githubusercontent.com/frontenrahan/ZSH_Termux/main/setup.sh | bash
```

Manual Install (deb)

```bash
pkg install ./zshauto_1.0.0_all.deb
```

Included

· zsh-syntax-highlighting (basic + fast)
· zsh-autosuggestions
· fast-highlight
· basic-highlight
· Custom .zshrc

Reinstall

```bash
pkg install --reinstall ./zshauto_1.0.0_all.deb
```

Remove

```bash
pkg uninstall zshauto
```

After Install

```bash
exec zsh
```
