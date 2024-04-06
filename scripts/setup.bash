#!/usr/bin/env bash
set -eux
# shellcheck source=./scripts/common.bash
source "$(dirname "$0")/common.bash"

/bin/bash "$CUR_DIR/setup-links.bash"
# /bin/bash "$CUR_DIR/change-schell.zsh"

echo "更新完了！ お疲れ様でした。新しいシェルを立ち上げてください"