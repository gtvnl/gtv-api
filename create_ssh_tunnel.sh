#!/bin/bash
createTunnel() {
  /usr/bin/ssh -N -o ServerAliveInterval=60 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -R 2222:localhost:222 ramsy@dcgs.nl -p 222
  if [[ $? -eq O ]]; then
    echo Tunnel created
  else
    echo Error creating tunnel
  fi
}
/usr/bin/pgrep -f "2222:localhost:222"
if [[ $? -ne O ]]; then
  echo Creating new tunnel
  createTunnel
fi
