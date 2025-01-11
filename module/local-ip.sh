# vim: ft=sh
#!/bin/bash

set -u

os=$(uname -s)

if [ $os = 'Darwin' ]; then
  device='en0'
  ip=$(ipconfig getifaddr en0 | ipconfig getifaddr en1)
elif [ $os = 'Linux' ]; then
  device=$(ip -4 -br a | grep UP | awk '{print $1}' | cut -f1 -d'/' | head -n 1)
  ip=$(ip -4 -br a | grep UP | awk '{print $3}' | cut -f1 -d'/' | head -n 1)
fi

echo $ip [$device] 

