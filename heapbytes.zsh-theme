#Author : Heapbytes <Gourav> (https://github.com/heapbytes)

PROMPT='
┌─[%F{green} $(get_ip_address)%f] [%F{cyan} %~%f] $(git_prompt_info)
└─➜ '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✏️ "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) ✅"

get_ip_address() {
  if [[ -n "$(ifconfig tun0 2>/dev/null)" ]]; then
    echo "%{$fg[green]%}tun0: $(ifconfig tun0 | awk '/inet / {print $2}')%{$reset_color%}"
  elif [[ -n "$(ifconfig wlan0 2>/dev/null)" ]]; then
    echo "%{$fg[green]%}wlan0: $(ifconfig wlan0 | awk '/inet / {print $2}')%{$reset_color%}"
  elif [[ -n "$(ifconfig en0 2>/dev/null)" ]]; then
    echo "%{$fg[green]%}en0: $(ifconfig en0 | awk '/inet / {print $2}')%{$reset_color%}"
  else
    echo "%{$fg[red]%}No IP%{$reset_color%}"
  fi
}
