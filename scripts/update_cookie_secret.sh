#!/usr/bin/env bash

# usage:
# 1) echo "cookie_string" | ./update_cookie_secret.sh
# 2) ./update_cookie_secret.sh "key1=val1; key2=val2; ..."
#
# 要求: gh CLI 已登录 (gh auth login) 并且你对 repo 有权限

set -e

REPO="licunyangokok/v2free-auto-checkin"
COOKIE_INPUT=""

if [ -n "$1" ]; then
  COOKIE_INPUT="$1"
else
  echo "请粘贴完整 Cookie 字符串，输入完成后按 Ctrl-D："
  COOKIE_INPUT=$(cat)
fi

if [ -z "$COOKIE_INPUT" ]; then
  echo "错误：未提供 Cookie 内容"
  exit 2
fi

echo -n "$COOKIE_INPUT" | gh secret set V2FREE_COOKIE -b -R "$REPO"

echo "✅ 已更新 secret V2FREE_COOKIE 在仓库 $REPO"
