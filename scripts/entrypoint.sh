#!/bin/sh
set -e
mkdir -p /paperclip/instances/default/logs
mkdir -p /paperclip/instances/default/data/run-logs
mkdir -p /paperclip/.claude
chown -R node:node /paperclip

# Replace claude binary with a gosu wrapper
CLAUDE_BIN=$(which claude)
cp "$CLAUDE_BIN" "${CLAUDE_BIN}.real"
cat > "$CLAUDE_BIN" << 'EOF'
#!/bin/sh
exec gosu node "$(dirname "$0")/claude.real" "$@"
EOF
chmod +x "$CLAUDE_BIN"

echo '{"permissions":{"allow":["Bash(*)","Read(*)","Write(*)","Edit(*)","Glob(*)","Grep(*)"]}}' > /paperclip/.claude/settings.json

exec gosu node "$@"