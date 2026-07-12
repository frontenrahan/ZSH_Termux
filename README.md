# ZSH Auto Configure - Custom Termux Shell

One-command custom ZSH setup with plugins.

## Quick Install
```bash
curl -sL https://raw.githubusercontent.com/frontenrahan/ZSH_Termux/refs/heads/main/setup | bash
```

Manual Install (deb)

```bash
wget https://github.com/frontenrahan/ZSH_Termux/releases/download/v1.0.0/zshauto_1.0.0_all.deb
```

```bash
dpkg -i ./zshauto_1.0.0_all.deb
```

Included

-> zsh-syntax-highlighting (basic and fast)
-> zsh-autosuggestions
-> fast-highlight
-> basic-highlight
-> Custom .zshrc

Reinstall

```bash
dpkg -i ./zshauto_1.0.0_all.deb
```

Remove

```bash
dpkg --purge zshauto
```

After Install

```bash
exec zsh
```
