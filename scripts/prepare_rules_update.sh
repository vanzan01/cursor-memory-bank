#!/bin/bash

# Step 1: Create backup
git checkout -b "backup-rules-$(date +%Y%m%d-%H%M)"

# Step 2: Rename directory
mv .cursor _cursor

# Step 3: Rename files
find _cursor -name "*.mdc" -exec mv {} {}.md \;
