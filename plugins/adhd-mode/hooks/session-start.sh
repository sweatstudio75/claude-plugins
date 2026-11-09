#!/bin/sh
# SessionStart hook: injects the adhd-mode rules so the mode is on from the first message.
# Never blocks session start: any failure exits 0 with no output.
# ponytail: no opt-in flag file (upstream uses one); disabling the plugin is the off switch.
# Claude Code caps hook stdout at 10,000 characters; beyond it only a 2,000-character preview
# reaches the model. Check after every SKILL.md edit: sh hooks/session-start.sh | wc -m

skill="$(dirname -- "$0")/../skills/adhd-mode/SKILL.md"
[ -f "$skill" ] || exit 0

printf '%s\n\n' 'ADHD MODE ACTIVE (adhd-mode plugin, on by default). The rules below apply to every response. "stop adhd mode" turns off this mode only; "normal mode" turns off every output mode, this one included. If the reader already turned ADHD mode off earlier in this session, stay off until they run /adhd-mode:adhd-mode.'
# Strip the leading YAML frontmatter block only; later "---" lines are kept.
awk 'NR == 1 && /^---[[:space:]]*$/ { fm = 1; next } fm && /^---[[:space:]]*$/ { fm = 0; next } !fm' "$skill" || exit 0
