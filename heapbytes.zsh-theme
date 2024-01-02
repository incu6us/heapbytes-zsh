#Author : Heapbytes <Gourav> (https://github.com/heapbytes)

PROMPT='
┌─[%F{blue} %~%f] [%F{green} $(get_ip_address)%f] $(git_prompt_info)
└─➜ '

RPROMPT='[%F{red}%?%f]'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✏️ "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) ✅"

get_ip_address() {
  if [[ -n "$(ifconfig tun0 2>/dev/null)" ]]; then
    echo "%{$fg[green]%}$(ifconfig tun0 | awk '/inet / {print $2}')%{$reset_color%}"
  elif [[ -n "$(ifconfig wlan0 2>/dev/null)" ]]; then
    echo "%{$fg[green]%}$(ifconfig wlan0 | awk '/inet / {print $2}')%{$reset_color%}"
  else
    echo "%{$fg[red]%}No IP%{$reset_color%}"
  fi
}
