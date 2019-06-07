#
# ~/.bashrc
#
set -o vi
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -al --color=auto'
alias dfh='df -h'
alias c='clear'
alias cp='cp -p'
alias h='history'
alias grep='grep --color=auto'

BLUE="\[\e[94m\]"
GREEN="\[\e[92m\]"
RED="\[\e[91m\]"
YELLOW="\[\e[93m\]"
CYAN="\[\e[36m\]"
NORM="\[\e[m\]"

if [ ${UID} == 0 ]; then
   export PS1="${CYAN}[${NORM}${RED}\u${NORM}@${YELLOW}\h${NORM}:\w${CYAN}]${NORM}${RED}# ${NORM}"
else
   export PS1="${CYAN}[${NORM}${BLUE}\u${NORM}@${YELLOW}\h${NORM}:\w${CYAN}]${NORM}${GREEN}\\$ ${NORM}"
fi

PATH=$PATH:/home/fredy/bin:/root/bin:/opt/Citrix/ICAClient

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/fredy/opt/google-cloud-sdk/path.bash.inc' ]; then . '/home/fredy/opt/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/fredy/opt/google-cloud-sdk/completion.bash.inc' ]; then . '/home/fredy/opt/google-cloud-sdk/completion.bash.inc'; fi

# Start Polkit Agent if Sway is running
pgrep sway > /dev/null 2>&1
if [ ${?} == 0 ]; then
   pgrep lxqt > /dev/null 2>&1
   if [ ${?} != 0 ];then 
      lxqt-policykit-agent > /dev/null 2>&1 & 
   fi
fi
