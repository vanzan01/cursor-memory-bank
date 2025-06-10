---
description: "Safe mode transition rules for Memory Bank workflow protection"
globs: "**/workflow/**", "**/mode-transitions/**", "**/safety/**"
alwaysApply: true
---

# SAFE MODE TRANSITIONS

> **TL;DR:** Comprehensive safety system for Memory Bank mode transitions, ensuring data preservation and workflow continuity through validation, migration, and recovery mechanisms.

## 🛡️ SAFE TRANSITION OVERVIEW

Safe Mode Transitions prevent data loss and workflow disruption by implementing comprehensive validation, backup, and migration procedures for all Memory Bank mode changes.

### Core Safety Principles

**Data Preservation**
- Never lose unfinished work
- Always create migration paths
- Maintain task continuity
- Preserve development context

**Validation First**
- Check readiness before transitions
- Validate system integrity
- Confirm user intentions
- Verify prerequisites

## 🔄 TRANSITION SAFETY MATRIX

### VAN Mode Entry Safety

**Safety Checks**
```bash
# Check for existing work
if [ -f "memory-bank/tasks.md" ]; then
  echo "🔍 Existing work detected"

  # Check for migration document
  if [ -f "memory-bank/migration.md" ]; then
    echo "✅ Migration document found - processing"
    process_migration
  else
    echo "⚠️ No migration found - creating safety backup"
    create_safety_backup
    warn_user_about_potential_loss
  fi
fi
```

**Safe Initialization**
```bash
van_safe_entry() {
  # 1. System validation
  validate_system_files

  # 2. Backup current state
  create_auto_backup "before-van-entry"

  # 3. Process existing work
  if [ -f "memory-bank/migration.md" ]; then
    process_migration_document
  elif [ -f "memory-bank/tasks.md" ]; then
    offer_migration_creation
  fi

  # 4. Initialize VAN mode
  initialize_van_mode
}
```

### REFLECT Mode Entry Safety

**Implementation Validation**
```bash
reflect_safety_check() {
  # Check implementation completion
  local completion=$(get_implementation_completion)

  if [ "$completion" -lt 90 ]; then
    echo "🚨 WARNING: Implementation only $completion% complete"
    echo "Risk: Premature reflection may miss important details"

    offer_options:
    - "Continue implementation"
    - "Create migration and proceed"
    - "Force reflection (not recommended)"
  fi

  # Check critical tasks
  local critical_incomplete=$(get_incomplete_critical_tasks)
  if [ -n "$critical_incomplete" ]; then
    echo "🚨 BLOCKED: Critical tasks incomplete"
    echo "Must complete before reflection:"
    echo "$critical_incomplete"
    return 1
  fi
}
```

**Safe Reflection Entry**
```bash
reflect_safe_entry() {
  # 1. Validate implementation status
  reflect_safety_check || return 1

  # 2. Create implementation backup
  create_auto_backup "before-reflection"

  # 3. Validate deliverables
  validate_deliverables

  # 4. Create migration for incomplete work
  if has_incomplete_work; then
    create_migration_document
  fi

  # 5. Initialize reflection mode
  initialize_reflect_mode
}
```

### ARCHIVE Mode Entry Safety

**Reflection Validation**
```bash
archive_safety_check() {
  # Check reflection completion
  if [ ! -f "memory-bank/reflection/reflection-$(date +%Y-%m-%d).md" ]; then
    echo "🚨 BLOCKED: Reflection not completed"
    echo "Must complete reflection before archiving"
    return 1
  fi

  # Validate reflection quality
  local reflection_score=$(validate_reflection_quality)
  if [ "$reflection_score" -lt 70 ]; then
    echo "⚠️ WARNING: Reflection quality score: $reflection_score%"
    echo "Consider improving reflection before archiving"
  fi
}
```

**Safe Archive Entry**
```bash
archive_safe_entry() {
  # 1. Validate reflection completion
  archive_safety_check || return 1

  # 2. Create final backup
  create_auto_backup "before-archive"

  # 3. Validate system documentation
  validate_system_documentation

  # 4. Create final migration
  create_final_migration

  # 5. Initialize archive mode
  initialize_archive_mode
}
```

## 🚨 SAFETY VALIDATION RULES

### Pre-Transition Validation

**System Integrity Check**
```bash
validate_system_integrity() {
  local errors=0

  # Check critical files
  [ -f "memory-bank/system/current-date.txt" ] || { echo "❌ Missing: current-date.txt"; ((errors++)); }
  [ -f "memory-bank/system/interaction-mode.txt" ] || { echo "❌ Missing: interaction-mode.txt"; ((errors++)); }
  [ -f "memory-bank/config/system.yaml" ] || { echo "❌ Missing: system.yaml"; ((errors++)); }

  # Check file permissions
  [ -r "memory-bank/tasks.md" ] || { echo "❌ Cannot read: tasks.md"; ((errors++)); }
  [ -w "memory-bank/" ] || { echo "❌ Cannot write to memory-bank/"; ((errors++)); }

  if [ $errors -gt 0 ]; then
    echo "🚨 System integrity check failed: $errors errors"
    return 1
  fi

  echo "✅ System integrity check passed"
  return 0
}
```

**Task Continuity Validation**
```bash
validate_task_continuity() {
  local incomplete_tasks=$(get_incomplete_tasks)
  local critical_tasks=$(get_incomplete_critical_tasks)

  if [ -n "$critical_tasks" ]; then
    echo "🚨 CRITICAL: Incomplete critical tasks detected"
    echo "$critical_tasks"
    return 1
  fi

  if [ -n "$incomplete_tasks" ]; then
    echo "⚠️ WARNING: Incomplete tasks detected"
    echo "$incomplete_tasks"
    echo "Recommendation: Create migration document"
    return 2  # Warning level
  fi

  echo "✅ Task continuity validation passed"
  return 0
}
```

### Migration Safety

**Migration Creation Safety**
```bash
create_safe_migration() {
  local migration_file="memory-bank/migration.md"

  # Backup existing migration if present
  if [ -f "$migration_file" ]; then
    cp "$migration_file" "$migration_file.backup.$(date +%Y%m%d-%H%M%S)"
  fi

  # Create comprehensive migration
  cat > "$migration_file" << EOF
---
migration:
  date: "$(date +%Y-%m-%d)"
  time: "$(date +%H:%M:%S)"
  from_mode: "$CURRENT_MODE"
  to_mode: "$TARGET_MODE"
  safety_level: "COMPREHENSIVE"

unfinished_tasks:
$(get_unfinished_tasks_yaml)

system_state:
  git_branch: "$(git branch --show-current)"
  git_commit: "$(git rev-parse HEAD)"
  working_directory: "$(pwd)"
  uncommitted_changes: $(git status --porcelain | wc -l)

context_preservation:
$(get_context_preservation_yaml)
EOF

  echo "✅ Safe migration created: $migration_file"
}
```

**Migration Processing Safety**
```bash
process_migration_safely() {
  local migration_file="memory-bank/migration.md"

  # Validate migration format
  if ! validate_migration_format "$migration_file"; then
    echo "🚨 ERROR: Invalid migration format"
    return 1
  fi

  # Create backup before processing
  create_auto_backup "before-migration-processing"

  # Process migration with error handling
  if process_migration_document "$migration_file"; then
    # Archive processed migration
    mv "$migration_file" "memory-bank/archive/migration-processed-$(date +%Y%m%d-%H%M%S).md"
    echo "✅ Migration processed successfully"
  else
    echo "🚨 ERROR: Migration processing failed"
    echo "Backup available for recovery"
    return 1
  fi
}
```

## 🔧 RECOVERY MECHANISMS

### Transition Failure Recovery

**Automatic Recovery**
```bash
recover_from_transition_failure() {
  local failure_type="$1"

  echo "🔄 Initiating automatic recovery from: $failure_type"

  case "$failure_type" in
    "validation_failure")
      # Restore previous state
      restore_from_backup "before-transition"
      echo "✅ Restored to pre-transition state"
      ;;
    "migration_failure")
      # Restore migration backup
      restore_migration_backup
      echo "✅ Migration backup restored"
      ;;
    "system_corruption")
      # Full system recovery
      initiate_system_recovery
      echo "✅ System recovery initiated"
      ;;
    *)
      echo "⚠️ Unknown failure type: $failure_type"
      echo "Manual recovery may be required"
      ;;
  esac
}
```

**Manual Recovery Options**
```bash
manual_recovery_menu() {
  echo "🛠️ Manual Recovery Options:"
  echo "[1] Restore from last backup"
  echo "[2] Restore specific file"
  echo "[3] Reset to clean state"
  echo "[4] Emergency recovery"
  echo "[5] Contact support"

  read -p "Select option (1-5): " choice

  case $choice in
    1) restore_from_last_backup ;;
    2) restore_specific_file ;;
    3) reset_to_clean_state ;;
    4) emergency_recovery ;;
    5) show_support_info ;;
    *) echo "Invalid option" ;;
  esac
}
```

### Emergency Procedures

**Emergency Stop**
```bash
emergency_stop() {
  echo "🚨 EMERGENCY STOP INITIATED"

  # Immediate backup
  create_emergency_backup

  # Stop all operations
  kill_background_processes

  # Preserve current state
  preserve_emergency_state

  # Show recovery options
  show_emergency_recovery_options
}
```

**Emergency Recovery**
```bash
emergency_recovery() {
  echo "🆘 EMERGENCY RECOVERY MODE"

  # Check system state
  assess_system_damage

  # Identify recovery options
  identify_recovery_paths

  # Execute safest recovery
  execute_emergency_recovery

  # Validate recovery success
  validate_recovery_success
}
```

## 📊 SAFETY METRICS

### Transition Safety Metrics

**Success Rates**
- Safe transitions: Target >99%
- Data preservation: Target 100%
- Recovery success: Target >95%
- User satisfaction: Target >4.5/5

**Performance Metrics**
- Transition validation time: Target <30s
- Migration creation time: Target <10s
- Recovery time: Target <2 minutes
- System availability: Target >99.9%

### Safety Quality Indicators

**EXCELLENT Safety (95-100%)**
- All validations pass
- Comprehensive backups
- Successful migrations
- Zero data loss

**GOOD Safety (85-94%)**
- Most validations pass
- Regular backups
- Mostly successful migrations
- Minimal data loss

**NEEDS IMPROVEMENT (<85%)**
- Validation failures
- Inconsistent backups
- Migration issues
- Data loss incidents

This safe mode transition system ensures reliable and secure Memory Bank operations with comprehensive protection against data loss and workflow disruption.
