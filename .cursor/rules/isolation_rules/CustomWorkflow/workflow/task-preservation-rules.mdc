---
description: "Task preservation rules for Memory Bank workflow continuity"
globs: "**/workflow/**", "**/task-preservation/**", "**/continuity/**"
alwaysApply: true
---

# TASK PRESERVATION RULES

> **TL;DR:** Comprehensive task preservation system ensuring 100% task continuity across Memory Bank mode transitions through automated migration, validation, and recovery mechanisms.

## 🛡️ TASK PRESERVATION OVERVIEW

Task Preservation Rules ensure that no work is ever lost during Memory Bank operations by implementing comprehensive preservation, migration, and recovery strategies for all task data.

### Core Preservation Principles

**Zero Loss Policy**
- Never delete task data without explicit user confirmation
- Always create migration paths for unfinished work
- Maintain complete task history and context
- Preserve task relationships and dependencies

**Automated Protection**
- Automatic task backup before critical operations
- Real-time task state monitoring
- Intelligent migration creation
- Proactive data preservation

## 📋 TASK PRESERVATION STRATEGIES

### 1. Automatic Task Migration

**Pre-Transition Migration**
```bash
create_task_migration() {
  local current_date=$(date +%Y-%m-%d)
  local migration_file="memory-bank/migration.md"

  # Extract unfinished tasks
  local unfinished_tasks=$(grep -A 20 "status: IN_PROGRESS\|status: PLANNED\|status: BLOCKED" memory-bank/tasks.md)

  if [ -n "$unfinished_tasks" ]; then
    cat > "$migration_file" << EOF
---
migration:
  date: "$current_date"
  type: "TASK_PRESERVATION"
  source_mode: "$CURRENT_MODE"
  target_mode: "$TARGET_MODE"

unfinished_tasks:
$unfinished_tasks

preservation_context:
  total_tasks: $(grep -c "^- id:" memory-bank/tasks.md)
  unfinished_count: $(echo "$unfinished_tasks" | grep -c "^- id:")
  critical_unfinished: $(echo "$unfinished_tasks" | grep -c "priority: CRITICAL")

task_relationships:
$(extract_task_dependencies)
EOF
    echo "✅ Task migration created: $migration_file"
  fi
}
```

### 2. Task State Monitoring

**Real-Time Task Tracking**
```bash
monitor_task_changes() {
  local tasks_file="memory-bank/tasks.md"
  local last_hash=""

  while true; do
    local current_hash=$(md5sum "$tasks_file" 2>/dev/null | cut -d' ' -f1)

    if [ "$current_hash" != "$last_hash" ] && [ -n "$last_hash" ]; then
      echo "📝 Task changes detected - creating backup"
      create_task_backup
      validate_task_integrity
    fi

    last_hash="$current_hash"
    sleep 30  # Check every 30 seconds
  done
}
```

### 3. Task Backup System

**Incremental Task Backups**
```bash
create_task_backup() {
  local backup_dir="memory-bank/backup/tasks"
  local timestamp=$(date +%Y%m%d-%H%M%S)

  mkdir -p "$backup_dir"

  # Create timestamped backup
  cp "memory-bank/tasks.md" "$backup_dir/tasks-$timestamp.md"

  # Create daily backup if not exists
  local daily_backup="$backup_dir/tasks-$(date +%Y-%m-%d).md"
  [ ! -f "$daily_backup" ] && cp "memory-bank/tasks.md" "$daily_backup"

  # Cleanup old backups (keep 30 days)
  find "$backup_dir" -name "tasks-*.md" -mtime +30 -delete

  echo "✅ Task backup created: tasks-$timestamp.md"
}
```

## 🔍 TASK VALIDATION RULES

### Task Integrity Validation

**Task Structure Validation**
```bash
validate_task_integrity() {
  local tasks_file="memory-bank/tasks.md"
  local errors=0

  # Check file exists and is readable
  [ -f "$tasks_file" ] || { echo "❌ Tasks file missing"; return 1; }
  [ -r "$tasks_file" ] || { echo "❌ Tasks file not readable"; return 1; }

  # Validate task structure
  while IFS= read -r line; do
    if [[ "$line" =~ ^-\ id:\ (.+) ]]; then
      local task_id="${BASH_REMATCH[1]}"

      # Check required fields
      if ! grep -A 10 "id: $task_id" "$tasks_file" | grep -q "status:"; then
        echo "❌ Task $task_id missing status field"
        ((errors++))
      fi

      if ! grep -A 10 "id: $task_id" "$tasks_file" | grep -q "priority:"; then
        echo "❌ Task $task_id missing priority field"
        ((errors++))
      fi
    fi
  done < "$tasks_file"

  if [ $errors -eq 0 ]; then
    echo "✅ Task integrity validation passed"
    return 0
  else
    echo "❌ Task integrity validation failed: $errors errors"
    return 1
  fi
}
```

### Task Dependency Validation

**Dependency Chain Validation**
```bash
validate_task_dependencies() {
  local tasks_file="memory-bank/tasks.md"
  local dependency_errors=0

  # Extract all task IDs
  local all_task_ids=$(grep "^- id:" "$tasks_file" | sed 's/^- id: //')

  # Check each dependency reference
  while IFS= read -r line; do
    if [[ "$line" =~ depends_on:\ (.+) ]]; then
      local dependency="${BASH_REMATCH[1]}"

      if ! echo "$all_task_ids" | grep -q "^$dependency$"; then
        echo "❌ Invalid dependency: $dependency (task not found)"
        ((dependency_errors++))
      fi
    fi
  done < "$tasks_file"

  if [ $dependency_errors -eq 0 ]; then
    echo "✅ Task dependency validation passed"
    return 0
  else
    echo "❌ Task dependency validation failed: $dependency_errors errors"
    return 1
  fi
}
```

## 🔄 TASK RECOVERY PROCEDURES

### Task Recovery from Migration

**Migration Processing**
```bash
process_task_migration() {
  local migration_file="memory-bank/migration.md"
  local tasks_file="memory-bank/tasks.md"

  if [ ! -f "$migration_file" ]; then
    echo "ℹ️ No migration file found"
    return 0
  fi

  echo "🔄 Processing task migration..."

  # Backup current tasks
  create_task_backup

  # Extract unfinished tasks from migration
  local unfinished_tasks=$(sed -n '/^unfinished_tasks:/,/^[a-z_]*:/p' "$migration_file" | head -n -1 | tail -n +2)

  if [ -n "$unfinished_tasks" ]; then
    # Merge with existing tasks
    echo "" >> "$tasks_file"
    echo "# Migrated Tasks from $(date +%Y-%m-%d)" >> "$tasks_file"
    echo "$unfinished_tasks" >> "$tasks_file"

    echo "✅ Migrated tasks merged into $tasks_file"

    # Archive processed migration
    mv "$migration_file" "memory-bank/archive/migration-processed-$(date +%Y%m%d-%H%M%S).md"
  else
    echo "ℹ️ No unfinished tasks found in migration"
  fi
}
```

### Task Recovery from Backup

**Selective Task Recovery**
```bash
recover_tasks_from_backup() {
  local backup_date="$1"
  local backup_file="memory-bank/backup/tasks/tasks-$backup_date.md"

  if [ ! -f "$backup_file" ]; then
    echo "❌ Backup file not found: $backup_file"
    return 1
  fi

  echo "🔄 Recovering tasks from backup: $backup_date"

  # Show backup info
  local backup_task_count=$(grep -c "^- id:" "$backup_file")
  echo "📊 Backup contains $backup_task_count tasks"

  # Create safety backup of current state
  create_task_backup

  # Restore from backup
  cp "$backup_file" "memory-bank/tasks.md"

  echo "✅ Tasks recovered from backup: $backup_date"

  # Validate recovered tasks
  validate_task_integrity
}
```

## 📊 TASK PRESERVATION METRICS

### Preservation Effectiveness

**Data Protection Metrics**
- Task loss incidents: Target 0
- Successful migrations: Target 100%
- Recovery success rate: Target >99%
- Data integrity maintained: Target 100%

**Performance Metrics**
- Migration creation time: Target <5 seconds
- Task backup time: Target <2 seconds
- Recovery time: Target <30 seconds
- Validation time: Target <10 seconds

### Quality Indicators

**EXCELLENT Preservation (95-100%)**
- Zero task loss incidents
- All migrations successful
- Complete data integrity
- Fast recovery times

**GOOD Preservation (85-94%)**
- Minimal task loss
- Most migrations successful
- Good data integrity
- Reasonable recovery times

**NEEDS IMPROVEMENT (<85%)**
- Task loss incidents
- Migration failures
- Data integrity issues
- Slow recovery

## 🛠️ TASK PRESERVATION TOOLS

### Preservation Commands

**Manual Backup**
```bash
# Create immediate task backup
backup_tasks_now() {
  create_task_backup
  echo "✅ Manual task backup completed"
}
```

**Migration Creation**
```bash
# Force migration creation
create_migration_now() {
  create_task_migration
  echo "✅ Task migration created"
}
```

**Recovery Tools**
```bash
# List available backups
list_task_backups() {
  echo "📋 Available task backups:"
  ls -la memory-bank/backup/tasks/tasks-*.md | awk '{print $9, $5, $6, $7, $8}'
}

# Quick recovery
quick_task_recovery() {
  local latest_backup=$(ls -t memory-bank/backup/tasks/tasks-*.md | head -1)
  echo "🔄 Recovering from latest backup: $(basename $latest_backup)"
  cp "$latest_backup" "memory-bank/tasks.md"
  validate_task_integrity
}
```

This task preservation system ensures 100% task continuity across all Memory Bank operations with comprehensive backup, migration, and recovery capabilities.
