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
  local interface="tun0"
  local ip=$(ip -4 addr show tun0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)

  if [[ -z "$ip" ]]; then
    interface="eth0"
    ip=$(ip -4 addr show eth0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)
  fi

  [[ -z "$ip" ]] && { interface="NoNet"; ip="0.0.0.0"; }

  echo "$interface $ip"
}

git_branch() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ -n "$branch" ]] && echo "%{$YELLOW%} $branch%{$RESET%}"
}

python_venv() {
  [[ -n "$VIRTUAL_ENV" ]] && echo "%{$MAGENTA%}[ $(basename $VIRTUAL_ENV)]%{$RESET%}"
}

exit_status() {
  [[ $? -eq 0 ]] && echo "%{$GREEN%}✔%{$RESET%}" || echo "%{$RED%}✗%{$RESET%}"
}

local PROMPT_CORNER="┌─"
local PROMPT_BOTTOM="└─"
local PROMPT_ARROW="➜"

local BASE_PROMPT="
${PROMPT_CORNER}[%~] [%n@%m | \$(get_ip_and_interface)] \$(python_venv) \$(git_branch)
${PROMPT_BOTTOM}${PROMPT_ARROW} "

if [[ $EUID -eq 0 ]]; then
  PROMPT="%{$RED%}${BASE_PROMPT}%{$RESET%}"
else
  PROMPT="%{$CYAN%}${BASE_PROMPT}%{$RESET%}"
fi

RPROMPT='$(exit_status)'
