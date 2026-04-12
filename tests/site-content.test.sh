#!/usr/bin/env bash
set -euo pipefail

if [[ ! -f index.html ]]; then
  echo "FAIL: index.html does not exist"
  exit 1
fi

assert_contains() {
  local needle="$1"
  if ! grep -Fq "$needle" index.html; then
    echo "FAIL: missing '$needle' in index.html"
    exit 1
  fi
}

assert_contains "hrhrng@foxmail.com"
assert_contains "HereComesBoAI"
assert_contains "github.com/hrhrng"
assert_contains "mailto:hrhrng@foxmail.com"
assert_contains "https://github.com/hrhrng"
assert_contains "关于我"
assert_contains "联系方式"

echo "PASS: site content is present"
