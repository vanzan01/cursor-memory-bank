---
description: "Backup system for Memory Bank data protection and recovery"
globs: "**/workflow/**", "**/backup/**", "**/recovery/**"
alwaysApply: true
---

# BACKUP SYSTEM

> **TL;DR:** Comprehensive backup system ensuring Memory Bank data protection through automated backups, version control integration, and reliable recovery procedures.

## 💾 BACKUP SYSTEM OVERVIEW

The Backup System provides multiple layers of data protection for Memory Bank operations, ensuring no work is ever lost and enabling quick recovery from any issues.

### Core Functions

**Automated Protection**
- Automatic backups before critical operations
- Git-based version control integration
- Incremental backup strategies
- Real-time data protection

**Recovery Capabilities**
- Point-in-time recovery
- Selective file restoration
- Complete system restoration
- Emergency recovery procedures

## 🔄 BACKUP STRATEGIES

### 1. Git-Based Backups (Primary)

**Automatic Commits**
```bash
# Before mode transitions
git add memory-bank/
git commit -m "AUTO-BACKUP: Before $(echo $MODE) mode transition - $(date)"

# Before critical operations
git add .
git commit -m "AUTO-BACKUP: Before critical operation - $(date)"
```

**Branch Protection**
```bash
# Create backup branch before major changes
git checkout -b "backup-$(date +%Y%m%d-%H%M%S)"
git push origin "backup-$(date +%Y%m%d-%H%M%S)"
```

### 2. File System Backups (Secondary)

**Critical Files Backup**
```bash
# Backup critical Memory Bank files
BACKUP_DIR="memory-bank/backup/$(date +%Y-%m-%d)"
mkdir -p "$BACKUP_DIR"

cp memory-bank/tasks.md "$BACKUP_DIR/tasks-$(date +%H%M%S).md"
cp memory-bank/system/current-date.txt "$BACKUP_DIR/"
cp memory-bank/system/interaction-mode.txt "$BACKUP_DIR/"
cp memory-bank/config/system.yaml "$BACKUP_DIR/"
```

**Archive Backups**
```bash
# Create compressed archive
tar -czf "memory-bank-backup-$(date +%Y%m%d-%H%M%S).tar.gz" memory-bank/
```

### 3. Emergency Backups (Tertiary)

**Rapid Backup**
```bash
# Quick backup for emergency situations
cp -r memory-bank/ "memory-bank-emergency-$(date +%Y%m%d-%H%M%S)/"
```

## 🚨 BACKUP TRIGGERS

### Automatic Backup Triggers

**Mode Transitions**
- Before entering any Memory Bank mode
- Before exiting IMPLEMENT mode
- Before ARCHIVE mode completion

**Critical Operations**
- Before applying Cursor workaround
- Before mass file operations
- Before system configuration changes

**Time-Based**
- Every 30 minutes during active work
- At the end of each work session
- Daily backup of complete state

### Manual Backup Triggers

**User-Initiated**
- Before experimental changes
- Before major refactoring
- Before system updates

**Emergency Situations**
- System instability detected
- Data corruption suspected
- Before recovery operations

## 📋 BACKUP VALIDATION

### Backup Integrity Checks

**File Verification**
```bash
# Verify backup completeness
backup_check() {
  local backup_dir="$1"

  # Check critical files exist
  [ -f "$backup_dir/tasks.md" ] || echo "ERROR: tasks.md missing"
  [ -f "$backup_dir/current-date.txt" ] || echo "ERROR: current-date.txt missing"
  [ -f "$backup_dir/interaction-mode.txt" ] || echo "ERROR: interaction-mode.txt missing"

  # Verify file sizes
  [ -s "$backup_dir/tasks.md" ] || echo "WARNING: tasks.md is empty"

  echo "Backup validation complete"
}
```

**Git Backup Verification**
```bash
# Verify git backup integrity
git_backup_check() {
  # Check if backup branch exists
  git branch -r | grep "backup-$(date +%Y%m%d)" || echo "WARNING: No backup branch today"

  # Verify recent commits
  git log --oneline -5 | grep "AUTO-BACKUP" || echo "WARNING: No recent auto-backups"

  # Check working directory is clean
  git status --porcelain | wc -l | xargs -I {} echo "Uncommitted files: {}"
}
```

## 🔧 RECOVERY PROCEDURES

### Quick Recovery

**Recent Work Recovery**
```bash
# Recover from last auto-backup
git reset --hard HEAD~1  # Go back one commit
git checkout memory-bank/tasks.md  # Restore specific file
```

**File-Specific Recovery**
```bash
# Recover specific file from backup
recover_file() {
  local file="$1"
  local backup_dir="memory-bank/backup/$(date +%Y-%m-%d)"

  if [ -f "$backup_dir/$(basename $file)" ]; then
    cp "$backup_dir/$(basename $file)" "$file"
    echo "Recovered: $file"
  else
    echo "ERROR: Backup not found for $file"
  fi
}
```

### Complete System Recovery

**Full System Restore**
```bash
# Restore from complete backup
restore_system() {
  local backup_archive="$1"

  # Create safety backup of current state
  mv memory-bank/ "memory-bank-before-restore-$(date +%Y%m%d-%H%M%S)/"

  # Extract backup
  tar -xzf "$backup_archive"

  echo "System restored from: $backup_archive"
}
```

**Git-Based Recovery**
```bash
# Recover from git backup branch
git_recovery() {
  local backup_branch="$1"

  # Create safety branch
  git checkout -b "before-recovery-$(date +%Y%m%d-%H%M%S)"

  # Switch to backup branch
  git checkout "$backup_branch"

  # Merge or cherry-pick specific changes
  git checkout main
  git merge "$backup_branch"
}
```

## 📊 BACKUP MONITORING

### Backup Health Metrics

**Backup Frequency**
- Auto-backups per day: Target >10
- Manual backups per week: Target >3
- Emergency backups: Track all occurrences

**Backup Quality**
- Backup completeness: Target 100%
- Backup integrity: Target 100%
- Recovery success rate: Target >95%

**Storage Metrics**
- Backup storage usage: Monitor growth
- Backup retention period: 30 days default
- Archive compression ratio: Target >50%

### Backup Alerts

**Missing Backups**
```bash
# Alert if no backup in last 4 hours
last_backup=$(git log --grep="AUTO-BACKUP" --format="%ct" -1)
current_time=$(date +%s)
time_diff=$((current_time - last_backup))

if [ $time_diff -gt 14400 ]; then  # 4 hours
  echo "ALERT: No backup in last 4 hours"
  echo "Last backup: $(date -d @$last_backup)"
fi
```

**Storage Warnings**
```bash
# Warn if backup storage is getting full
backup_size=$(du -sh memory-bank/backup/ | cut -f1)
echo "Backup storage usage: $backup_size"

# Clean old backups if needed
find memory-bank/backup/ -type f -mtime +30 -delete
```

## 🛡️ BACKUP SECURITY

### Backup Protection

**Access Control**
- Backup files read-only after creation
- Restricted access to backup directories
- Encrypted backups for sensitive data

**Integrity Protection**
- Checksums for backup verification
- Digital signatures for critical backups
- Tamper detection mechanisms

### Backup Retention

**Retention Policy**
- Daily backups: Keep 7 days
- Weekly backups: Keep 4 weeks
- Monthly backups: Keep 12 months
- Emergency backups: Keep indefinitely

**Cleanup Automation**
```bash
# Automated backup cleanup
cleanup_backups() {
  # Remove daily backups older than 7 days
  find memory-bank/backup/ -name "*daily*" -mtime +7 -delete

  # Remove weekly backups older than 28 days
  find memory-bank/backup/ -name "*weekly*" -mtime +28 -delete

  # Archive monthly backups older than 365 days
  find memory-bank/backup/ -name "*monthly*" -mtime +365 -exec gzip {} \;
}
```

This backup system ensures comprehensive data protection for Memory Bank operations with multiple recovery options and automated protection mechanisms.
