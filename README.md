# Axira Zsh Theme

A sleek, modern multi-line Zsh theme built specially for Red Teamers, Bug Bounty Hunters and Pentesters, with smart VPN/IP detection, Python virtualenv, Git branch, and pretty exit status.


<img width="438" height="264" alt="image" src="https://github.com/user-attachments/assets/8e75ec57-2311-4402-b03a-bf5076aeb175" />


## ✨ Axira Zsh Theme — Features
✅ Clean multi-line prompt

Top line shows: current directory, user@hostname, active network interface & IP

Bottom line shows a neat arrow prompt for commands

✅ Network interface detection

Automatically shows tun0 or eth0 with your local IP

Falls back to NoNet if no network is found

✅ Dynamic user@hostname block

Shows your username and short hostname so you always know your context

✅ Python virtual environment indicator 🐍

Displays the active Python virtualenv name, if any

✅ Git branch info

Shows the current Git branch with a nice icon when inside a Git repo

✅ Command exit status

Shows ✔ for success or ✗ for error as a right-side prompt (RPROMPT)

✅ Root user mode 🔒

When you’re root (sudo -s or sudo su), your entire prompt turns red for maximum visibility — so you never accidentally run dangerous commands as root

✅ Lightweight & fast

Pure Zsh, no extra plugins or dependencies

Works perfectly with Oh My Zsh custom themes

## ⚡️ Installation

1. Clone the repo into your custom Oh My Zsh themes:
   ```bash
   git clone https://github.com/YOUR_USERNAME/axira-zsh-theme.git $ZSH_CUSTOM/themes/axira
   ```
2. Edit your ~/.zshrc:
  ```bash
   ZSH_THEME="axira/axira"
  ```
3. Reload:
  ```bash
  source ~/.zshrc
  ```
 

      
