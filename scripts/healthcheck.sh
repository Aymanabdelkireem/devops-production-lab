#!/usr/bin/env bash
set -euo pipefail

URL="${1:-http://localhost:8000/health}"

echo "Checking: $URL"

STATUS_CODE=$(curl -s -o /tmp/healthcheck.out -w "%{http_code}" "$URL" || true)

echo "Status code: $STATUS_CODE"
cat /tmp/healthcheck.out || true
echo

if [ "$STATUS_CODE" != "200" ]; then
  echo "Healthcheck failed"
  exit 1
fi

echo "Healthcheck passed"
