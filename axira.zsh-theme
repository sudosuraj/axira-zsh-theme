# ~/.oh-my-zsh/custom/themes/axira.zsh-theme

autoload -U colors && colors
setopt prompt_subst

local BLUE="%F{33}"
local GREEN="%F{76}"
local RED="%F{196}"
local YELLOW="%F{226}"
local MAGENTA="%F{201}"
local CYAN="%F{51}"
local RESET="%f%k"

get_ip_and_interface() {
  local vpn_iface=""
  local fallback_iface=""
  local ip=""

  # Get all interfaces
  for iface in $(ip -o link show | awk -F': ' '{print $2}'); do
    if [[ "$iface" == "lo" ]]; then
      continue
    elif [[ "$iface" == "eth0" || "$iface" == "eth1" ]]; then
      fallback_iface=$iface
    else
      vpn_iface=$iface
      break
    fi
  done

  # Prefer VPN-like interface
  if [[ -n "$vpn_iface" ]]; then
    ip=$(ip -4 addr show "$vpn_iface" 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)
    [[ -n "$ip" ]] && { echo "$vpn_iface $ip"; return; }
  fi

  # Fallback to eth0/eth1
  if [[ -n "$fallback_iface" ]]; then
    ip=$(ip -4 addr show "$fallback_iface" 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)
    [[ -n "$ip" ]] && { echo "$fallback_iface $ip"; return; }
  fi

  echo "NoNet 0.0.0.0"
}

git_branch() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ -n "$branch" ]] && echo "%{$YELLOW%} $branch%{$RESET%}"
}

python_venv() {
  [[ -n "$VIRTUAL_ENV" ]] && echo "%{$MAGENTA%}[ $(basename $VIRTUAL_ENV) ]%{$RESET%}"
}

exit_status() {
  [[ $? -eq 0 ]] && echo "%{$GREEN%}✔%{$RESET%}" || echo "%{$RED%}✗%{$RESET%}"
}

local PROMPT_CORNER="┌─"
local PROMPT_BOTTOM="└─"
local PROMPT_ARROW="➜"

build_prompt() {
  local BASE_PROMPT="
${PROMPT_CORNER}[%~] [%n@%m | $(get_ip_and_interface)] $(python_venv) $(git_branch)
${PROMPT_BOTTOM}${PROMPT_ARROW} "

  if [[ $EUID -eq 0 ]]; then
    PROMPT="%{$RED%}${BASE_PROMPT}%{$RESET%}"
  else
    PROMPT="%{$CYAN%}${BASE_PROMPT}%{$RESET%}"
  fi
}

precmd() { build_prompt }

RPROMPT='$(exit_status)'
