#!/bin/sh
set -e
mkdir -p /paperclip/instances/default/logs
mkdir -p /paperclip/instances/default/data/run-logs
mkdir -p /paperclip/.claude
chown -R node:node /paperclip
echo '{"permissions":{"allow":["Bash(*)","Read(*)","Write(*)","Edit(*)","Glob(*)","Grep(*)"]}}' > /paperclip/.claude/settings.json
exec gosu node "$@"