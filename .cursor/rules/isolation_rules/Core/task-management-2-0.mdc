---
description: Memory Bank 2.0.0 Task Management System Rules
globs: "**/memory-bank/**", "**/tasks/**", "**/contexts/**", "**/reports/**"
alwaysApply: true
---

# MEMORY BANK 2.0.0 TASK MANAGEMENT SYSTEM

## CORE PRINCIPLES

### 1. YYYY-MM-DD DATE FORMAT
**Rule**: All files containing dates MUST use YYYY-MM-DD format at the beginning of filename
```
✅ Correct: 2025-06-20-HIGH-FEATURE-task-name.md
❌ Incorrect: task-name-20-06-2025.md
```

**Benefits**:
- Chronological sorting across all systems
- Visual navigation improvement
- Cross-platform compatibility
- Future-proof date handling

### 2. INDIVIDUAL TASK DIRECTORIES
**Rule**: Each task MUST be encapsulated within its own directory, serving as a single source of truth for all task-related artifacts.

```
New Structure:
└── memory-bank/
    ├── tasks/
    │   ├── todo/
    │   │   └── YYYY-MM-DD_ID-XXX_task-name/  <-- Task Directory
    │   │       ├── _task.md                     <-- Main task file
    │   │       ├── _context.md                  <-- Task-specific context
    │   │       ├── _reflection.md               <-- Task reflection
    │   │       ├── _archive.md                  <-- Archival document
    │   │       ├── creative/                    <-- Creative phase artifacts
    │   │       ├── reports/                     <-- Task-specific reports
    │   │       └── release/                     <-- Release artifacts
    ├── in_progress/
    │   └── YYYY-MM-DD_ID-XXX_task-name/
    │       └── ... (same structure)
    └── done/
        └── YYYY-MM-DD_ID-XXX_task-name/
            └── ... (same structure)
```

### 3. FOLDER HIERARCHY ARCHITECTURE
```
memory-bank/
├── tasks/
│   ├── todo/{YYYY-MM-DD_ID-XXX_task-name}/  <-- New task directory structure
│   ├── in_progress/{YYYY-MM-DD_ID-XXX_task-name}/
│   └── done/{YYYY-MM-DD_ID-XXX_task-name}/
├── system/
│   └── current-task.txt  <-- NEW: Active task pointer
├── reports/
│   ├── daily/
│   ├── weekly/
│   └── monthly/
├── templates/
├── indexes/
└── scripts/
```

### 4. CONTEXT MANAGEMENT PER TASK
**Rule**: Each task MUST have its context encapsulated within its dedicated task directory.

```
Context Structure:
memory-bank/tasks/{todo|in_progress|done}/YYYY-MM-DD_ID-XXX_task-name/_context.md
- LATEST_REQUEST
- REQUEST_HISTORY
- Mental state preservation
- Working state tracking
- Session planning
- Recovery procedures
```

**WIP Limits**:
- Maximum 3 active contexts simultaneously
- Clear suspension/restoration workflows
- Context switching cost mitigation (25-minute recovery time)

### 5. AUTOMATED REPORTING SYSTEM
**Rule**: REFLECT mode MUST include automated reporting commands

**Daily Reports**: `memory-bank/scripts/daily-report.sh`
**Weekly Reports**: `memory-bank/scripts/weekly-report.sh`
**Monthly Reports**: `memory-bank/scripts/monthly-report.sh`

**Report Contents**:
- Task completion metrics
- Time tracking analysis
- Productivity trends
- Archive links to completed tasks

## MODE-SPECIFIC INTEGRATIONS

### VAN MODE REQUIREMENTS
**Rule**: VAN mode MUST perform automatic migration on EVERY activation

```bash
# Migration Process:
1. Scan for legacy tasks.md files
2. Parse and categorize all tasks
3. Create individual task files with YYYY-MM-DD format
4. Organize into priority-based folders
5. Preserve all task metadata and context
6. Generate migration report
```

**Search Integration**: VAN MUST find and migrate ALL task-related content

### PLAN/CREATIVE MODE REQUIREMENTS
**Rule**: MUST perform requirement analysis with @web search BEFORE task execution

```markdown
Pre-execution Checklist:
- [ ] User requirements clearly understood?
- [ ] @web search completed for unclear aspects?
- [ ] All technical details researched?
- [ ] Implementation approach validated?
- [ ] Dependencies identified?

IF ANY UNCLEAR → MANDATORY @web research
```

### REFLECT MODE REPORTING
**Rule**: REFLECT mode MUST generate comprehensive reports

```bash
# Available Commands:
./scripts/daily-report.sh [YYYY-MM-DD]
./scripts/weekly-report.sh [YYYY-W##]
./scripts/monthly-report.sh [YYYY-MM]
```

**Report Integration**:
- Link to completed tasks in archive
- Performance metrics analysis
- Trend identification
- Improvement recommendations

### UNIVERSAL MODE INTEGRATION
**Rule**: All modes MUST support new task management structure

```yaml
Mode Updates Required:
- VAN: Auto-migration + new structure support
- PLAN: Task creation with new naming
- CREATIVE: Context-aware task handling
- IMPLEMENT: New folder structure usage
- QA: New validation rules
- REFLECT: Automated reporting integration
- ARCHIVE: Date-based organization
```

## MIGRATION STRATEGY

### Legacy Migration Process
```bash
# 7-Phase Safe Migration:
1. PREPARATION: Backup and validation
2. PARSING: Extract tasks from legacy files
3. ORGANIZATION: Apply new naming and structure
4. VALIDATION: Verify data integrity
5. CONTEXT_CREATION: Generate context files
6. INDEX_UPDATE: Update master indexes
7. REPORTING: Generate migration report
```

### Data Preservation
**Rule**: ZERO data loss during migration
- Complete backup before migration
- Validation at each step
- Rollback capability
- Progress tracking and reporting

## VALIDATION RULES

### File Naming Validation
```regex
Task Directory: ^\d{4}-\d{2}-\d{2}_ID-\d{3}_[a-z0-9-]+$ # For the task directory (e.g., 2025-06-25_ID-001_implement-user-auth)
Internal Task File: ^_task\.md$
Internal Context File: ^_context\.md$
Report Files: ^(daily|weekly|monthly)-report-\d{4}-.*\.md$
```

### Folder Structure Validation
```bash
# Required Directories:
memory-bank/tasks/{todo,in_progress,done}/
memory-bank/contexts/{active,suspended,archived}/
memory-bank/reports/{daily,weekly,monthly}/
memory-bank/{templates,indexes,scripts}/
```

### Context Preservation Validation
```yaml
Required Context Fields:
- task_id: Unique task identifier
- focus_area: Current work focus
- mental_state: Cognitive context
- working_state: Technical context
- session_plan: Next steps
- recovery_notes: Resume instructions
```

## AUTOMATION REQUIREMENTS

### Script Integration
**Rule**: All scripts MUST be cross-platform compatible (macOS/Linux/Windows)

```bash
# Required Scripts:
- migrate-from-legacy.sh: Legacy migration
- daily-report.sh: Daily reporting
- weekly-report.sh: Weekly reporting
- monthly-report.sh: Monthly reporting
- update-indexes.sh: Index maintenance
```

### Template System
**Rule**: Standardized templates for consistency

```markdown
Templates Required:
- task-template.md: Standard task structure
- context-template.md: Context preservation
- report-templates/: All report formats
```

## INTEGRATION CHECKPOINTS

### Pre-Task Execution
1. ✅ Requirements analysis completed?
2. ✅ @web research performed if needed?
3. ✅ Task file created with proper naming?
4. ✅ Context file initialized?
5. ✅ Priority and category assigned?

### During Task Execution
1. ✅ Context regularly updated?
2. ✅ Progress tracked in task file?
3. ✅ Working state preserved?
4. ✅ Dependencies documented?

### Post-Task Completion
1. ✅ Task moved to appropriate done/ folder?
2. ✅ Context archived or cleaned up?
3. ✅ Indexes updated?
4. ✅ Reports generated?
5. ✅ Lessons learned documented?

## COMPLIANCE VERIFICATION

### Daily Checks
- All active tasks have proper context files
- No orphaned tasks without context
- Proper folder organization maintained
- Report generation functional

### Weekly Validation
- Migration completeness verified
- Index accuracy confirmed
- Script functionality tested
- Template consistency maintained

### Monthly Review
- System performance analysis
- Rule compliance assessment
- Optimization opportunities identified
- Documentation updates applied

This rule ensures Memory Bank 2.0.0 operates with maximum efficiency, proper organization, and comprehensive task management capabilities while maintaining backward compatibility and safe migration paths.