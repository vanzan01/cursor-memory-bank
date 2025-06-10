---
description: Migration system for preserving task context between Memory Bank modes
globs: "**/workflow/**", "**/migration/**", "**/preserve*/**"
alwaysApply: true
---

# MIGRATION SYSTEM FOR TASK PRESERVATION

> **TL;DR:** This system creates and processes migration documents to preserve task context, implementation details, and development state during Memory Bank mode transitions.

## 🔄 MIGRATION SYSTEM OVERVIEW

The Migration System ensures 100% preservation of development work by creating structured migration documents that capture:

- **Task Context**: Current status, progress, and next steps
- **Implementation State**: Code changes, configurations, and dependencies
- **Development Environment**: Branch state, working directory, and tool configurations
- **Knowledge Artifacts**: Decisions made, lessons learned, and technical insights

## 📋 MIGRATION DOCUMENT STRUCTURE

### Standard Migration Format

The migration document uses YAML format for structured data preservation:

```yaml
# migration.md
migration:
  metadata:
    created_date: "2024-12-09T10:30:00Z"
    created_by: "Memory Bank System"
    from_mode: "IMPLEMENT"
    to_mode: "REFLECT"
    migration_type: "PARTIAL_COMPLETION"

  context:
    active_branch: "implement-task-continuity-fix-20250610"
    working_directory: "/Users/vedmalex/work/cursor-memory-bank"
    last_commit: "186e1eb"
    uncommitted_changes: true

  tasks:
    completed:
      - id: "RULES-INT-2024-12-09"
        status: "COMPLETED"
        completion_date: "2024-12-09"
        archived: true

    in_progress:
      - id: "TASK-CONTINUITY-FIX-2024-12-09"
        status: "IN_PROGRESS"
        priority: "CRITICAL"
        completion: 75
        current_phase: "Phase 1: Task Status Validation"
        next_steps:
          - "Complete Phase 2: Migration System Integration"
          - "Implement Phase 3: Safe Mode Transitions"
          - "Finalize Phase 4: Task Preservation Rules"
```

## 🔄 MIGRATION TYPES

### 1. Completion Migration (IMPLEMENT → REFLECT)

**Trigger**: All tasks completed, ready for reflection
**Purpose**: Archive completed work and prepare for reflection
**Content Focus**: Implementation results, testing outcomes, deliverables

### 2. Partial Migration (IMPLEMENT → REFLECT with incomplete work)

**Trigger**: Forced transition with unfinished tasks
**Purpose**: Preserve incomplete work context for future continuation
**Content Focus**: Current progress, next steps, blockers

### 3. Interruption Migration (Any mode → VAN)

**Trigger**: New high-priority task requires immediate attention
**Purpose**: Preserve current work state for later resumption
**Content Focus**: Complete context preservation

### 4. Archive Migration (REFLECT → ARCHIVE)

**Trigger**: Reflection complete, ready for archiving
**Purpose**: Create final knowledge artifact
**Content Focus**: Lessons learned, insights, future recommendations

## 🔧 MIGRATION PROCESSING WORKFLOW

### Migration Creation Process

1. **Trigger Detection**
   - Mode transition requested
   - Validation system detects incomplete work
   - User confirms migration creation

2. **Context Analysis**
   - Scan current tasks.md for unfinished work
   - Analyze git state and uncommitted changes
   - Identify key files and configurations
   - Extract implementation progress

3. **Content Generation**
   - Create structured migration document
   - Preserve task context and next steps
   - Document technical decisions
   - Capture environment state

4. **Validation and Storage**
   - Validate migration document format
   - Store in memory-bank/migration.md
   - Create backup of current state
   - Update system tracking

### Migration Processing on VAN Mode Start

1. **Migration Detection**
   - Check for existing migration.md
   - Validate migration document format
   - Extract migration metadata

2. **Context Restoration**
   - Parse unfinished tasks
   - Restore task priorities and status
   - Merge with any new tasks
   - Preserve implementation context

3. **Environment Setup**
   - Restore working directory state
   - Check git branch and commit state
   - Validate file modifications
   - Restore tool configurations

4. **Task Integration**
   - Merge migrated tasks with new tasks
   - Resolve any conflicts or duplicates
   - Update task priorities and dependencies
   - Create unified task list

## 📊 MIGRATION CONTENT TEMPLATES

### Task Context Template

Each migrated task includes comprehensive context:

**Basic Information**
- Task ID and status
- Priority and completion percentage
- Current phase and next phase
- Dependencies and blockers

**Implementation Details**
- Files modified and created
- Configuration changes
- Technical decisions made
- Code architecture notes

**Progress Tracking**
- Phases completed
- Current work state
- Immediate next steps
- Future planning items

### Environment Context Template

Environment preservation includes:

**Git State**
- Current branch and last commit
- Uncommitted files
- Stash availability
- Repository status

**Workspace State**
- Working directory path
- Open files in IDE
- Active breakpoints
- Terminal command history

**Tool Configuration**
- Package manager and versions
- Dependencies status
- Build and test status
- Development environment setup

## 🔍 MIGRATION VALIDATION RULES

### Format Validation

**Required Fields**
- migration.metadata (with date, modes, type)
- migration.context (with branch, directory)
- migration.tasks (with at least one task)

**Optional Fields**
- migration.environment (recommended for complex tasks)
- migration.knowledge (recommended for learning capture)

### Content Validation

**Task Validation**
- Each task must have id, status, priority
- IN_PROGRESS tasks must have completion percentage
- IN_PROGRESS tasks must have next_steps
- PLANNED tasks must have planning_complete flag

**Context Validation**
- Branch name must be valid git branch
- Working directory must exist
- File paths must be relative to project root
- Completion percentages must be 0-100

### Integrity Validation

**Consistency Checks**
- Task dependencies must reference existing tasks
- File modifications must be trackable in git
- Completion percentages must align with status
- Next steps must be actionable

**Completeness Checks**
- All unfinished work must be captured
- Critical context must be preserved
- Environment state must be restorable
- Knowledge artifacts must be documented

## 🔄 MIGRATION LIFECYCLE

### Creation Lifecycle

1. **Trigger Event** → Migration needed
2. **Context Capture** → Gather current state
3. **Document Generation** → Create migration.md
4. **Validation** → Verify completeness
5. **Storage** → Save to memory-bank/
6. **Backup** → Archive current state

### Processing Lifecycle

1. **Detection** → migration.md found
2. **Validation** → Verify format and content
3. **Context Restoration** → Restore environment
4. **Task Integration** → Merge with new tasks
5. **Cleanup** → Archive processed migration
6. **Continuation** → Resume development

### Archive Lifecycle

1. **Completion** → Task cycle finished
2. **Final Migration** → Create archive migration
3. **Knowledge Extraction** → Extract insights
4. **Documentation** → Update system docs
5. **Storage** → Move to archive/
6. **Reset** → Prepare for next cycle

## 🔧 INTEGRATION POINTS

### File System Integration

**migration.md Location**
- Primary: `memory-bank/migration.md`
- Archive: `memory-bank/archive/migration-YYYY-MM-DD.md`
- Backup: `memory-bank/backup/migration-backup-TIMESTAMP.md`

**Processing Integration**
- VAN mode checks for migration.md on startup
- REFLECT mode creates migration.md if needed
- ARCHIVE mode creates final migration before cleanup

### Mode Integration

**VAN Mode**
- Detect and process existing migration.md
- Merge migrated tasks with new requirements
- Restore development environment context
- Continue interrupted work seamlessly

**REFLECT Mode**
- Create migration.md for incomplete work
- Preserve implementation context
- Document lessons learned
- Prepare for safe archiving

**ARCHIVE Mode**
- Create final migration with complete context
- Archive all knowledge artifacts
- Clean up for next development cycle
- Preserve institutional knowledge

This migration system ensures seamless preservation and restoration of development context across all Memory Bank mode transitions.