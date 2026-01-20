#!/bin/bash

files=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.txt$' || true)

if [ -z "$files" ]; then
  exit 0
fi

vowels='[AEIOUYaeiouyАЕЁИОУЫЭЮЯаеёиоуыэюя]'

for f in $files; do
  if [ ! -f "$f" ]; then
    continue
  fi

  if ! grep -qE "$vowels" "$f"; then
    echo "Error: in file $f there are no vowels - commit canceled"
    exit 1
  fi
done

exit 0
