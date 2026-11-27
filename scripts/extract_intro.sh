#!/bin/bash

OUTPUT="all_intro.md"

for file in "$@"; do
    awk '/^## /{if(found)exit;found=1} /^### /{if(found)exit} found' "$file" >> "$OUTPUT"
done

