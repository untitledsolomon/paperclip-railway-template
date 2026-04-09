#!/bin/sh
set -e
mkdir -p /paperclip/instances/default/logs
mkdir -p /paperclip/.claude
echo '{"permissions":{"allow":["Bash(*)","Read(*)","Write(*)","Edit(*)","Glob(*)","Grep(*)"]}}' > /paperclip/.claude/settings.json
exec "$@"