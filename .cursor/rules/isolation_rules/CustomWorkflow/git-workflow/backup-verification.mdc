---
description: "Backup verification and recovery procedures for git workflow"
globs: "**/*"
alwaysApply: false
---

# BACKUP VERIFICATION AND RECOVERY

> **TL;DR:** Comprehensive backup verification and recovery procedures to ensure safe development and quick recovery from issues.

## 🔧 GIT WORKFLOW CONTROLLER INTEGRATION

All git operations MUST use the centralized Git Workflow Controller:

```bash
# Load Git Workflow Controller
fetch_rules(["isolation_rules/Core/git-workflow-controller.mdc"])
git_controller_init
```

## 🔒 BACKUP VERIFICATION WORKFLOW

```mermaid
graph TD
    Start["Start Task"] --> CheckGit["Check Git Status"]
    CheckGit --> Clean{"Working Tree<br>Clean?"}
    Clean -->|No| Stash["Stash Changes"]
    Clean -->|Yes| CreateBackup["Create Backup Branch"]
    Stash --> CreateBackup

    CreateBackup --> VerifyBackup["Verify Backup"]
    VerifyBackup --> TagBackup["Tag Backup Point"]
    TagBackup --> ProceedWork["Proceed with Work"]

    ProceedWork --> CheckPoint["Regular Checkpoints"]
    CheckPoint --> VerifyIntegrity["Verify Integrity"]
```

## 📋 BACKUP VERIFICATION RULES

### Rule #38: Pre-Task Backup Verification
- **When**: Before starting any Level 3-4 task or risky changes
- **What**: Verify git status, create backup branch, tag stable point
- **Purpose**: Ensure safe rollback point exists

### Rule #39: Regular Backup Integrity Checks
- **When**: Daily for active development, weekly for stable branches
- **What**: Verify backup branches exist and are accessible
- **Purpose**: Ensure backups are valid when needed

### Rule #40: Automated Recovery Procedures
- **When**: When issues are detected or rollback is needed
- **What**: Standardized recovery procedures with verification
- **Purpose**: Quick and safe recovery from problems

## 🎯 PRE-TASK BACKUP PROCEDURE

### Step 1: Git Status Verification
```bash
# Check current git status using controller
git_status_check

# Expected: Clean working tree or known changes
# If unexpected changes exist, investigate before proceeding
```

### Step 2: Working Tree Cleanup
```bash
# If working tree is dirty, stash changes using controller
git_stash_push "Pre-backup stash: $(date)"

# Verify working tree is now clean
git_status_check
# Expected: "nothing to commit, working tree clean"
```

### Step 3: Backup Branch Creation
```bash
# Ensure we're on main branch using controller
git_checkout main
git_pull origin main

# Create backup branch with timestamp using controller
BACKUP_NAME="backup/pre-$(date +%Y%m%d-%H%M)-$(git rev-parse --short HEAD)"
git_branch_create "$BACKUP_NAME"
git_push origin "$BACKUP_NAME"

# Return to main using controller
git_checkout main
```

### Step 4: Backup Verification
```bash
# Verify backup branch exists locally using controller
git_branch_list | grep "backup/pre-$(date +%Y%m%d)"

# Verify backup branch exists remotely using controller
git_remote_list origin | grep "backup/pre-$(date +%Y%m%d)"

# Verify backup branch content matches main using controller
git_diff main "$BACKUP_NAME"
# Expected: No differences
```

### Step 5: Tag Creation
```bash
# Create annotated tag for backup point using controller
TAG_NAME="backup-$(date +%Y%m%d-%H%M)"
git_tag_create "$TAG_NAME" "Backup before task: [TASK-ID]"
git_push origin "$TAG_NAME"
```

## 🔍 BACKUP INTEGRITY VERIFICATION

### Daily Verification Script:
```bash
#!/bin/bash
# daily-backup-check.sh

echo "=== Daily Backup Integrity Check ==="
echo "Date: $(date)"

# Check for recent backup branches
echo "Recent backup branches:"
git_branch_list "remote" | grep "backup/" | tail -5

# Verify backup branches are accessible
for branch in $(git_branch_list "remote" | grep "backup/" | tail -3); do
    echo "Checking $branch..."
    git_show "$branch" --stat > /dev/null
done

# Check backup tags
echo "Recent backup tags:"
git_tag_list | grep "backup-" | tail -5

# Verify disk space for git objects
echo "Git repository size:"
du -sh .git/
```

### Weekly Deep Verification:
```bash
#!/bin/bash
# weekly-backup-verification.sh

echo "=== Weekly Deep Backup Verification ==="

# Verify all backup branches
for branch in $(git_branch_list "remote" | grep "backup/"); do
    echo "Deep checking $branch..."

    # Check branch integrity
    git_fsck_check "$branch"

    # Verify branch can be checked out
    git_checkout "$branch" --quiet
    if [ $? -eq 0 ]; then
        echo "✅ $branch checkout successful"
        git_checkout "main" --quiet
    else
        echo "❌ $branch checkout failed"
    fi
done

# Clean up old backup branches (older than 30 days)
echo "Cleaning up old backup branches..."
git_tag_create "archived-$(basename $branch)" "Archived backup: $branch"
git_push origin "archived-$(basename $branch)"
```

## 🚨 RECOVERY PROCEDURES

### Emergency Rollback to Backup:
```bash
#!/bin/bash
# emergency-rollback.sh

BACKUP_BRANCH="$1"
if [ -z "$BACKUP_BRANCH" ]; then
    echo "Usage: emergency-rollback.sh <backup-branch-name>"
    echo "Available backups:"
    git_branch_list "remote" | grep "backup/"
    exit 1
fi

echo "=== EMERGENCY ROLLBACK PROCEDURE ==="
echo "Rolling back to: $BACKUP_BRANCH"
echo "Current HEAD: $(git rev-parse HEAD)"

# Confirm rollback
read -p "Are you sure you want to rollback? (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
    echo "Rollback cancelled"
    exit 1
fi

# Create emergency backup of current state
EMERGENCY_BACKUP="emergency-backup-$(date +%Y%m%d-%H%M%S)"
git_branch_create "$EMERGENCY_BACKUP"
git_push origin "$EMERGENCY_BACKUP"
echo "Current state backed up to: $EMERGENCY_BACKUP"

# Perform rollback
git_checkout main
git_reset_hard "origin/$BACKUP_BRANCH"
git_push origin main --force

echo "✅ Rollback completed"
echo "Emergency backup available at: $EMERGENCY_BACKUP"
```

### Selective File Recovery:
```bash
#!/bin/bash
# recover-file.sh

BACKUP_BRANCH="$1"
FILE_PATH="$2"

if [ -z "$BACKUP_BRANCH" ] || [ -z "$FILE_PATH" ]; then
    echo "Usage: recover-file.sh <backup-branch> <file-path>"
    exit 1
fi

echo "Recovering $FILE_PATH from $BACKUP_BRANCH"

# Verify file exists in backup
git_show "$BACKUP_BRANCH:$FILE_PATH" > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "❌ File not found in backup branch"
    exit 1
fi

# Create backup of current file
if [ -f "$FILE_PATH" ]; then
    cp "$FILE_PATH" "$FILE_PATH.backup-$(date +%Y%m%d-%H%M%S)"
    echo "Current file backed up"
fi

# Recover file from backup
git_show "$BACKUP_BRANCH:$FILE_PATH" > "$FILE_PATH"
echo "✅ File recovered from backup"
```

## 📊 BACKUP MONITORING AND ALERTS

### Backup Health Metrics:
```bash
#!/bin/bash
# backup-health-metrics.sh

echo "=== Backup Health Report ==="

# Count backup branches
BACKUP_COUNT=$(git_branch_list "remote" | grep -c "backup/")
echo "Total backup branches: $BACKUP_COUNT"

# Check backup frequency
RECENT_BACKUPS=$(git_branch_list "remote" | grep "backup/" | xargs -I {} git_log --format="%ci" -1 {} | sort -r | head -5)
echo "Recent backup dates:"
echo "$RECENT_BACKUPS"

# Check backup size
BACKUP_SIZE=$(git for-each-ref --format='%(objectsize)' refs/remotes/origin/backup/ | awk '{sum+=$1} END {print sum/1024/1024 " MB"}')
echo "Total backup size: $BACKUP_SIZE"

# Alert if no recent backups
LAST_BACKUP=$(git for-each-ref --format='%(committerdate:unix)' refs/remotes/origin/backup/ | sort -n | tail -1)
CURRENT_TIME=$(date +%s)
DAYS_SINCE_BACKUP=$(( (CURRENT_TIME - LAST_BACKUP) / 86400 ))

if [ $DAYS_SINCE_BACKUP -gt 7 ]; then
    echo "⚠️  WARNING: No backup created in $DAYS_SINCE_BACKUP days"
else
    echo "✅ Recent backup found ($DAYS_SINCE_BACKUP days ago)"
fi
```

## 🔄 AUTOMATED BACKUP PROCEDURES

### Git Hooks for Automatic Backup:
```bash
#!/bin/sh
# pre-push hook for automatic backup

# Check if pushing to main branch
if [ "$2" = "refs/heads/main" ]; then
    echo "Creating automatic backup before push to main..."

    # Create backup branch
    BACKUP_NAME="auto-backup-$(date +%Y%m%d-%H%M)"
    git_branch_create "$BACKUP_NAME"
    git_push origin "$BACKUP_NAME"

    echo "Automatic backup created: $BACKUP_NAME"
fi
```

### CI/CD Backup Integration:
```yaml
# .github/workflows/backup.yml
name: Automated Backup
on:
  push:
    branches: [main]
  schedule:
    - cron: '0 2 * * *'  # Daily at 2 AM

jobs:
  backup:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
        with:
          fetch-depth: 0

              - name: Create Daily Backup
        run: |
          BACKUP_NAME="daily-backup-$(date +%Y%m%d)"
          git_branch_create "$BACKUP_NAME"
          git_push origin "$BACKUP_NAME"

      - name: Verify Backup Integrity
        run: |
          ./scripts/backup-health-metrics.sh
```

This comprehensive backup system ensures development safety and quick recovery capabilities.