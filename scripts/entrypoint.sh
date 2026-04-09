#!/bin/sh
set -e
mkdir -p /paperclip/instances/default/logs
mkdir -p /paperclip/.claude
echo '{"permissions":{"allow":["Bash(*)","Read(*)","Write(*)","Edit(*)","Glob(*)","Grep(*)","WebFetch(*)"]}}' > /paperclip/.claude/settings.json
chown -R node:node /paperclip
exec gosu node "$@"