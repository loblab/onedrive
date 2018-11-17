#!/bin/bash
set -e

onedrive --version

# check a refresh token exists
if [ -f /config/refresh_token ]; then
  echo "Found onedrive refresh token..."
else
  echo
  echo "-------------------------------------"
  echo "ONEDRIVE LOGIN REQUIRED"
  echo "-------------------------------------"
  echo "To use this container you must authorize the OneDrive Client."

  if [ -t 0 ] ; then
    echo "-------------------------------------"
    echo
  else
    echo
    echo "Please re-start start the container in interactive mode using the -it flag:"
    echo
    echo "docker run -it -v /local/config/path:/config -v /local/documents/path:/documents loblab/onedrive"
    echo "or"
    echo "docker-compose run onedrive1"
    echo
    echo "Once authorized you can re-create container with interactive mode disabled."
    echo "-------------------------------------"
    echo
    exit 1
  fi

fi

echo "Starting onedrive client..."
if [ -z "$DEBUG" ]; then
  DEBUG=false
fi
if [ -z "$MODE" ]; then
  MODE=monitor
fi
set -x
onedrive --$MODE --confdir=/config --syncdir=/documents --verbose=$DEBUG

