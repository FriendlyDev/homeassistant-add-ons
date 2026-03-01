#!/bin/sh

# Use the default server config file if we don't have one
if [ ! -f /etc/ntfy/server.yml ]; then
  echo "server.yml does not exist, using the default one with admin:changeme account"
  cat /server.yml.default > /etc/ntfy/server.yml
fi

# Remove default server config file
if [ -f /server.yml.default ]; then
  echo "removing server.yml.default as not needed..."
  rm -f /server.yml.default
fi

# Download the file if it doesn't exist
if [ ! -f /etc/ntfy/server.yml.example ]; then
  echo "server.yml.example file missing, lets download that for you"
  wget -q --tries=1 https://raw.githubusercontent.com/binwiederhier/ntfy/main/server/server.yml -O /etc/ntfy/server.yml.example
fi

# Switch to the container command
echo "starting the ntfy server"
exec "$@"
