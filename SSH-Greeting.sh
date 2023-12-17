#!/bin/bash

CPUTIME=$(ps -eo pcpu | awk 'NR>1' | awk '{tot=tot+$1} END {print tot}')
CPUCORES=$(cat /proc/cpuinfo | grep -c processor)

echo -e "
\033[31m$(figlet KALI INFO)
\033[36m################################################
\033[37m[\033[31m~\033[37m]\033[36m Server Name \033[37m- \033[31m`hostname`
\033[37m[\033[31m~\033[37m]\033[36m Public IP \033[37m- \033[31m`dig +short myip.opendns.com @resolver1.opendns.com`
\033[37m[\033[31m~\033[37m]\033[36m Local IP \033[37m- \033[31m`hostname -I`
\033[37m[\033[31m~\033[37m]\033[36m OS Version \033[37m- \033[31m`echo -n $(lsb_release -d | awk '/^/{print $2,$3,$4}') && echo -n ' ' && cat /etc/debian_version | awk '/^/{print $1}'`
\033[37m[\033[31m~\033[37m]\033[36m Uptime \033[37m- \033[31m`uptime -p | awk '{ print $2 " " $3 }'`
\033[37m[\033[31m~\033[37m]\033[36m CPU (average) \033[37m- \033[31m`echo $CPUTIME / $CPUCORES | bc`%
\033[37m[\033[31m~\033[37m]\033[36m Memory free (real) \033[37m- \033[31m`free -m | head -n 2 | tail -n 1 | awk {'print $4'}` Mb
\033[37m[\033[31m~\033[37m]\033[36m Memory free (cache) \033[37m- \033[31m`free -m | head -n 3 | tail -n 1 | awk {'print $3'}` Mb
\033[37m[\033[31m~\033[37m]\033[36m Swap in use \033[37m- \033[31m`free -m | tail -n 1 | awk {'print $3'}` Mb
\033[37m[\033[31m~\033[37m]\033[36m Free Disk Space Root \033[37m- \033[31m`df -h / | awk '{ a = $4 } END { print a }'`
\033[37m[\033[31m~\033[37m]\033[36m Free Disk Space Home \033[37m- \033[31m`df -h /home | awk '{ a = $4 } END { print a }'`
\033[37m" > $HOME/.motd
cat $HOME/.motd
