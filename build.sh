#!/usr/bin/env bash
set -euo pipefail

if [ -z "${API_BASE:-}" ]; then
  echo "ERROR: API_BASE env var is not set." >&2
  echo "Set it in the Vercel project (e.g. Production: https://investors-api.gokabisa.com/api/v1, Preview: https://investors-api.staging.gokabisa.com/api/v1)." >&2
  exit 1
fi

sed -i "s|__API_BASE__|${API_BASE}|g" index.html admin.html
echo "Substituted __API_BASE__ -> ${API_BASE} in index.html, admin.html"
