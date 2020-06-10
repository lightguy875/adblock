#Script do Roteador
#Defining aliases

alias GREPFILTER="grep -o '^[^#]*' | grep -vF -e \"::\" -e \";\" -e \"//\" -e \"http\" -e \"https\" -e \"@\" -e \"mailto\" | tr -cd '\000-\177'"
alias GREPSIMPLE="grep 0.0.0.0"
alias AWKFILTER="awk '{print \$2}'"

#Downloading lists
wget -qO /tmp/mvps http://winhelp2002.mvps.org/hosts.txt && cat /tmp/mvps | GREPSIMPLE  > /tmp/mvps_filtered && rm /tmp/mvps
wget -qO /tmp/cameleon http://sysctl.org/cameleon/hosts && cat /tmp/cameleon |  AWKFILTER | awk '$0="0.0.0.0 "$0' > /tmp/cameleon_filtered && rm /tmp/cameleon

#merging files
awk '!a[$0]++' /tmp/cameleon_filtered /tmp/mvps_filtered > /tmp/hostblock && rm /tmp/cameleon_filtered /tmp/mvps_filtered

#Restarting dnsmasq service
stopservice dnsmasq && startservice dnsmasq

