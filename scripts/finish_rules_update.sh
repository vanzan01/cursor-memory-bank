#!/bin/bash

# Step 5: Restore files
find _cursor -name "*.mdc.md" -exec sh -c 'mv "$1" "${1%.md}"' _ {} \;

# Step 6: Restore directory
mv _cursor .cursor

# Step 7: Commit changes
git add .cursor/
git commit -m "Modified rules via Cursor workaround"