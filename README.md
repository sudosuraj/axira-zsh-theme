# Axira Zsh Theme

`axira` is a minimal, pentester-focused `oh-my-zsh` theme designed for clean, useful, and context-rich prompts.\
It automatically shows your active VPN or network IP, your user context, Python virtual environments, Git branches, and clear indicators for root access.

---

## Features

- **Multi-line prompt**\
  Displays the current working directory, user, hostname, interface name, and IP address in a clean format.

- **VPN-aware IP detection**\
  Automatically shows your VPN IP (via `tun0`) if connected, otherwise falls back to your local `eth0` IP. Perfect for CTFs, labs, and external networks.

- **Dynamic prompt**\
  Uses `setopt prompt_subst` to refresh the network information every time you hit Enter. No more stale IPs.

- **Root warning**\
  If you are root (`sudo -s` or `sudo su`), the entire prompt turns red to warn you clearly.

- **Python virtual environment**\
  Displays the active Python virtual environment name when one is active.

- **Git branch detection**\
  Shows the current Git branch if you are in a Git repository.

- **Command status indicator**\
  Shows ✔ if the last command succeeded, or ✗ if it failed, on the right-hand side (`RPROMPT`).

---

## Prompt Example

```
┌─[~/HTB] [kali@MyLaptop | tun0 10.8.0.2]
└─➜  # When VPN is connected

┌─[~] [kali@MyLaptop | eth0 192.168.1.10]
└─➜  # When VPN is disconnected

┌─[~] [root@MyLaptop | eth0 192.168.1.10]
└─➜  # Root user - whole prompt in red
```

<img width="438" height="264" alt="image" src="https://github.com/user-attachments/assets/2e54e28e-8a36-486d-96e4-6b0ae4ba89ff" />


---

## Installation

1. Copy the theme file to your Oh My Zsh custom themes folder:

   ```bash
   mkdir -p ~/.oh-my-zsh/custom/themes
   cp axira.zsh-theme ~/.oh-my-zsh/custom/themes/
   ```

2. Edit your `.zshrc`:

   ```bash
   ZSH_THEME="axira"
   ```

3. Make sure `setopt prompt_subst` is in the theme (included by default).\
   This ensures that your VPN IP/interface always refreshes automatically.

4. Reload your shell:

   ```bash
   source ~/.zshrc
   ```

---

## Recommended for

- Pentesters who need to quickly see which network (VPN or local) they are using
- CTF players on Hack The Box, TryHackMe, or labs
- Developers who want minimal distractions but clear context

---

## License

MIT License. Free to use, modify, and share.

