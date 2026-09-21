#!/usr/bin/env bash
#
# yatline.yazi still calls `File:icon()`, which Yazi 26.x deprecated in favour of
# `th.icon:match(file)`. The old call makes Yazi show a "Deprecated API" warning
# on every start. Upstream has not fixed it (last release: 2026-01), so patch it
# locally and re-run this after `ya pkg upgrade`, which overwrites plugin files.
#
# Safe to run repeatedly - it exits early when the patch is already applied.

set -euo pipefail

target="${1:-$HOME/.config/yazi/plugins/yatline.yazi/main.lua}"

if [[ ! -f "$target" ]]; then
  echo "yatline not installed at $target, nothing to patch"
  exit 0
fi

if ! grep -q 'hovered:icon()' "$target"; then
  echo "yatline already patched"
  exit 0
fi

# `th.icon:match` returns nil when no icon rule matches, so guard the access.
perl -0pi -e 's/\t\t\tlocal icon = hovered:icon\(\)\.text\n\t\t\treturn icon \.\. " " \.\. name/\t\t\t-- `File:icon()` is deprecated since Yazi 26.x, and `th.icon:match` may return nil.\n\t\t\tlocal icon = th.icon:match(hovered)\n\t\t\treturn (icon and icon.text or "") .. " " .. name/' "$target"

if grep -q 'th.icon:match(hovered)' "$target"; then
  echo "yatline patched"
else
  echo "yatline patch failed - the upstream code changed, check $target" >&2
  exit 1
fi
