#!/bin/sh

mkdir -p /config/ntfy_server
ln -s /config/ntfy_server /etc/ntfy

# Use the default server config file if we don't have one
if [ ! -f /etc/ntfy/server.yml ]; then
  echo "server.yml does not exist, using the default one with admin:changeme account"
  cat /ntfy/server.yml.default > /etc/ntfy/server.yml
fi

# Download the file if it doesn't exist
if [ ! -f /ntfy/server.yml.downloaded ]; then
  wget -q --tries=1 --timeout=3 https://raw.githubusercontent.com/binwiederhier/ntfy/main/server/server.yml -O /etc/ntfy/server.yml.example
fi

if [ -f /ntfy/server.yml.downloaded ]; then
  rm -f /ntfy/server.yml.example
  mv /ntfy/server.yml.downloaded /ntfy/server.yml.example
fi

if [ ! -f /etc/ntfy/server.yml.example ]; then
  cat /ntfy/server.yml.example > /etc/ntfy/server.yml.example
fi

# Switch to the container command
echo "starting the ntfy server"
exec "$@"
