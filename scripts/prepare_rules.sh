#!/bin/bash

# Step 2: Rename directory
mv .cursor _cursor

# Step 3: Rename files
find _cursor -name "*.mdc" -exec mv {} {}.md \;
