#!/bin/sh
set -e
# When Railway mounts a volume at /paperclip it is often not writable by the node user.
# Create dirs Paperclip needs and ensure the whole tree is owned by node.
mkdir -p /paperclip/instances/default/logs
chown -R node:node /paperclip
export HOME=/root
gosu node sh -c 'mkdir -p ~/.claude && echo "{\"dangerouslySkipPermissions\":true}" > ~/.claude/settings.json'
exec gosu node "$@"
