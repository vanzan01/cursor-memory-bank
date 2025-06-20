#!/bin/bash

# Memory Bank Legacy Migration Script
# Migrates from single tasks.md to new individual task structure

set -e  # Exit on any error

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"
MEMORY_BANK_DIR="$PROJECT_ROOT/memory-bank"
LOG_FILE="$MEMORY_BANK_DIR/migration-$(date +%Y%m%d-%H%M%S).log"
BACKUP_DIR="$MEMORY_BANK_DIR/backup-$(date +%Y%m%d-%H%M%S)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging function
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Colored output functions
info() {
    echo -e "${BLUE}ℹ️  $1${NC}" | tee -a "$LOG_FILE"
}

success() {
    echo -e "${GREEN}✅ $1${NC}" | tee -a "$LOG_FILE"
}

warning() {
    echo -e "${YELLOW}⚠️  $1${NC}" | tee -a "$LOG_FILE"
}

error() {
    echo -e "${RED}❌ $1${NC}" | tee -a "$LOG_FILE"
}

# Error handling
handle_error() {
    error "Migration failed at phase $CURRENT_PHASE"
    error "Check log file: $LOG_FILE"
    error "Backup available at: $BACKUP_DIR"
    exit 1
}

trap handle_error ERR

# Migration phases
CURRENT_PHASE=0

# Phase 0: Preparation and Validation
prepare_migration() {
    CURRENT_PHASE=1
    info "Phase 1: Preparing migration environment"

    # Check if legacy tasks.md exists
    if [ ! -f "$MEMORY_BANK_DIR/tasks.md" ]; then
        warning "No legacy tasks.md found. Nothing to migrate."
        exit 0
    fi

    # Create backup directory
    mkdir -p "$BACKUP_DIR"

    # Create full backup
    cp -r "$MEMORY_BANK_DIR" "$BACKUP_DIR/original/"
    success "Backup created: $BACKUP_DIR"

    # Validate new structure exists
    if [ ! -d "$MEMORY_BANK_DIR/tasks/todo" ]; then
        error "New task structure not found. Run structure creation first."
        exit 1
    fi

    success "Migration environment prepared"
}

# Phase 1: Parse legacy tasks.md
parse_legacy_tasks() {
    CURRENT_PHASE=2
    info "Phase 2: Parsing legacy tasks.md"

    local tasks_file="$MEMORY_BANK_DIR/tasks.md"
    local temp_dir="$MEMORY_BANK_DIR/.migration-temp"

    mkdir -p "$temp_dir"

    # Extract tasks using awk script
    awk '
    BEGIN {
        task_count = 0
        in_task = 0
        current_task = ""
        task_id = ""
        task_status = "TODO"
        task_priority = "MEDIUM"
        task_category = "FEATURE"
    }

    # Detect task headers
    /^## / {
        if (in_task && current_task != "") {
            # Save previous task
            save_task()
        }

        # Start new task
        in_task = 1
        task_count++
        current_task = $0 "\n"

        # Extract task info from header
        task_name = $0
        gsub(/^## /, "", task_name)
        gsub(/[^a-zA-Z0-9-]/, "-", task_name)
        gsub(/-+/, "-", task_name)
        gsub(/^-|-$/, "", task_name)
        task_id = tolower(task_name)

        next
    }

    # Detect status
    /Статус:/ {
        if (in_task) {
            if (/IN_PROGRESS|В РАБОТЕ/) task_status = "IN_PROGRESS"
            else if (/DONE|ЗАВЕРШЕНО/) task_status = "DONE"
            else if (/BLOCKED|ЗАБЛОКИРОВАНО/) task_status = "BLOCKED"
            else task_status = "TODO"
        }
    }

    # Detect priority
    /Приоритет:/ {
        if (in_task) {
            if (/CRITICAL|КРИТИЧЕСКИЙ/) task_priority = "CRITICAL"
            else if (/HIGH|ВЫСОКИЙ/) task_priority = "HIGH"
            else if (/LOW|НИЗКИЙ/) task_priority = "LOW"
            else task_priority = "MEDIUM"
        }
    }

    # Add all lines to current task
    {
        if (in_task) {
            current_task = current_task $0 "\n"
        }
    }

    # Function to save task
    function save_task() {
        if (current_task != "" && task_id != "") {
            # Generate filename
            date_str = strftime("%Y-%m-%d")
            filename = date_str "-" task_priority "-" task_category "-" task_id ".md"
            filepath = "'"$temp_dir"'/" filename

            # Write task file
            print "# " date_str "-" task_priority "-" task_category "-" task_id > filepath
            print "" >> filepath
            print "**Дата создания**: " date_str >> filepath
            print "**Статус**: " task_status >> filepath
            print "**Приоритет**: " task_priority >> filepath
            print "**Категория**: " task_category >> filepath
            print "" >> filepath
            print "---" >> filepath
            print "" >> filepath
            print current_task >> filepath

            # Log task creation
            print "Created: " filename > "/dev/stderr"
        }
    }

    END {
        if (in_task && current_task != "") {
            save_task()
        }
        print "Total tasks parsed: " task_count > "/dev/stderr"
    }
    ' "$tasks_file"

    # Count parsed tasks
    local parsed_count=$(find "$temp_dir" -name "*.md" | wc -l)
    success "Parsed $parsed_count tasks from legacy file"
}

# Phase 2: Organize tasks into folders
organize_tasks() {
    CURRENT_PHASE=3
    info "Phase 3: Organizing tasks into folder structure"

    local temp_dir="$MEMORY_BANK_DIR/.migration-temp"
    local moved_count=0

    for task_file in "$temp_dir"/*.md; do
        if [ -f "$task_file" ]; then
            local filename=$(basename "$task_file")
            local status=$(grep "^**Статус**:" "$task_file" | sed 's/.*: //')
            local priority=$(grep "^**Приоритет**:" "$task_file" | sed 's/.*: //')

            # Determine target directory
            local target_dir=""
            case "$status" in
                "TODO")
                    case "$priority" in
                        "CRITICAL") target_dir="$MEMORY_BANK_DIR/tasks/todo/critical" ;;
                        "HIGH") target_dir="$MEMORY_BANK_DIR/tasks/todo/high" ;;
                        "MEDIUM") target_dir="$MEMORY_BANK_DIR/tasks/todo/medium" ;;
                        "LOW") target_dir="$MEMORY_BANK_DIR/tasks/todo/low" ;;
                        *) target_dir="$MEMORY_BANK_DIR/tasks/todo/medium" ;;
                    esac
                    ;;
                "IN_PROGRESS")
                    target_dir="$MEMORY_BANK_DIR/tasks/in_progress/active"
                    ;;
                "BLOCKED")
                    target_dir="$MEMORY_BANK_DIR/tasks/in_progress/blocked"
                    ;;
                "DONE")
                    target_dir="$MEMORY_BANK_DIR/tasks/done/2025-06"
                    ;;
                *)
                    target_dir="$MEMORY_BANK_DIR/tasks/todo/medium"
                    ;;
            esac

            # Move file to target directory
            mv "$task_file" "$target_dir/"
            ((moved_count++))
            info "Moved: $filename -> $(basename "$target_dir")"
        fi
    done

    # Clean up temp directory
    rm -rf "$temp_dir"

    success "Organized $moved_count tasks into folder structure"
}

# Phase 3: Update indexes
update_indexes() {
    CURRENT_PHASE=4
    info "Phase 4: Updating system indexes"

    # Count tasks by status and priority
    local todo_critical=$(find "$MEMORY_BANK_DIR/tasks/todo/critical" -name "*.md" | wc -l)
    local todo_high=$(find "$MEMORY_BANK_DIR/tasks/todo/high" -name "*.md" | wc -l)
    local todo_medium=$(find "$MEMORY_BANK_DIR/tasks/todo/medium" -name "*.md" | wc -l)
    local todo_low=$(find "$MEMORY_BANK_DIR/tasks/todo/low" -name "*.md" | wc -l)

    local in_progress_active=$(find "$MEMORY_BANK_DIR/tasks/in_progress/active" -name "*.md" | wc -l)
    local in_progress_blocked=$(find "$MEMORY_BANK_DIR/tasks/in_progress/blocked" -name "*.md" | wc -l)
    local in_progress_review=$(find "$MEMORY_BANK_DIR/tasks/in_progress/review" -name "*.md" | wc -l)

    local done_june=$(find "$MEMORY_BANK_DIR/tasks/done/2025-06" -name "*.md" | wc -l)

    local total_todo=$((todo_critical + todo_high + todo_medium + todo_low))
    local total_in_progress=$((in_progress_active + in_progress_blocked + in_progress_review))
    local total_done=$done_june
    local total_tasks=$((total_todo + total_in_progress + total_done))

    # Update master index
    sed -i.bak "s/\*\*Общее количество задач\*\*: 0/**Общее количество задач**: $total_tasks/" "$MEMORY_BANK_DIR/indexes/master-index.md"
    sed -i.bak "s/- \*\*📋 TODO\*\*: \[0 задач\]/- **📋 TODO**: [$total_todo задач]/" "$MEMORY_BANK_DIR/indexes/master-index.md"
    sed -i.bak "s/- \*\*⚙️ IN PROGRESS\*\*: \[0 задач\]/- **⚙️ IN PROGRESS**: [$total_in_progress задач]/" "$MEMORY_BANK_DIR/indexes/master-index.md"
    sed -i.bak "s/- \*\*✅ DONE\*\*: \[0 задач\]/- **✅ DONE**: [$total_done задач]/" "$MEMORY_BANK_DIR/indexes/master-index.md"

    # Remove backup file
    rm -f "$MEMORY_BANK_DIR/indexes/master-index.md.bak"

    success "Updated indexes with $total_tasks total tasks"
}

# Phase 4: Archive legacy file
archive_legacy() {
    CURRENT_PHASE=5
    info "Phase 5: Archiving legacy tasks.md"

    local legacy_file="$MEMORY_BANK_DIR/tasks.md"
    local archive_file="$MEMORY_BANK_DIR/archive/legacy-tasks-$(date +%Y%m%d-%H%M%S).md"

    # Move legacy file to archive
    mv "$legacy_file" "$archive_file"

    success "Legacy tasks.md archived as: $(basename "$archive_file")"
}

# Phase 5: Create migration report
create_report() {
    CURRENT_PHASE=6
    info "Phase 6: Creating migration report"

    local report_file="$MEMORY_BANK_DIR/reports/migration-report-$(date +%Y%m%d-%H%M%S).md"

    cat > "$report_file" << EOF
# Migration Report

**Date**: $(date +%Y-%m-%d)
**Time**: $(date +%H:%M:%S)
**Migration ID**: migration-$(date +%Y%m%d-%H%M%S)

## Summary

Successfully migrated from legacy tasks.md to new Memory Bank 2.0 structure.

### Statistics:
- **Total tasks migrated**: $(find "$MEMORY_BANK_DIR/tasks" -name "*.md" | wc -l)
- **TODO tasks**: $(find "$MEMORY_BANK_DIR/tasks/todo" -name "*.md" | wc -l)
- **IN PROGRESS tasks**: $(find "$MEMORY_BANK_DIR/tasks/in_progress" -name "*.md" | wc -l)
- **DONE tasks**: $(find "$MEMORY_BANK_DIR/tasks/done" -name "*.md" | wc -l)

### Files created:
$(find "$MEMORY_BANK_DIR/tasks" -name "*.md" -exec basename {} \; | sort)

### Backup location:
$BACKUP_DIR

### Migration log:
$LOG_FILE

## Next Steps

1. Review migrated tasks for accuracy
2. Update task links and references
3. Create contexts for active tasks
4. Setup automated reporting

Migration completed successfully! 🎉
EOF

    success "Migration report created: $(basename "$report_file")"
}

# Main migration function
main() {
    info "Starting Memory Bank Legacy Migration"
    info "Log file: $LOG_FILE"

    prepare_migration
    parse_legacy_tasks
    organize_tasks
    update_indexes
    archive_legacy
    create_report

    success "Migration completed successfully!"
    success "Backup preserved at: $BACKUP_DIR"
    success "Migration log: $LOG_FILE"

    info "Next steps:"
    info "1. Review migrated tasks: memory-bank/tasks/"
    info "2. Check master index: memory-bank/indexes/master-index.md"
    info "3. Read migration report: memory-bank/reports/"
}

# Run migration
main "$@"