#!/bin/bash

# Step 1: Create backup
git checkout -b "backup-rules-$(date +%Y%m%d-%H%M)"

./prepare_rules.sh
