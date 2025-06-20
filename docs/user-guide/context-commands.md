# Context Management Commands Guide

> **Complete guide to Memory Bank's context management commands**

## 🎯 Overview

Memory Bank's context management system provides seamless continuity across development sessions. This guide covers all available commands and their usage.

## 📋 Core Commands

### CONTINUE / ПРОДОЛЖАЙ
**Purpose**: Resume interrupted work exactly where you left off

**Usage**:
```bash
CONTINUE
# or
ПРОДОЛЖАЙ
```

**What it does**:
- Reads `memory-bank/system/current-context.md`
- Restores your previous working mode
- Recovers task progress and session state
- Resumes work with full context

**Example Response**:
```
🔄 Restoring context from 2025-06-20 14:30:00
📋 Previous mode: IMPLEMENT
🎯 Task: Context Management System Implementation
📊 Progress: 75% complete - Phase 3 of 4
▶️ Resuming IMPLEMENT mode...
```

### SHOW CONTEXT
**Purpose**: Display current context information

**Usage**:
```bash
SHOW CONTEXT
```

**What it displays**:
- Current working mode and phase
- Active task details and progress
- Session metrics and timestamps
- Project rules and discovered tasks

**Example Output**:
```
📊 CURRENT CONTEXT STATE
========================
🔧 Mode: IMPLEMENT (Phase 3/4)
📋 Task: Context Management System Implementation
⏱️ Session: 2h 15m active
📈 Progress: 75% complete
🎯 Next: Complete Phase 4 - Integration Testing
```

### CLEAR CONTEXT
**Purpose**: Manually clear saved context (use with caution)

**Usage**:
```bash
CLEAR CONTEXT
```

**When to use**:
- Starting completely new project
- After task completion (usually automatic)
- Resolving context corruption issues

**Safety Warning**:
```
⚠️ WARNING: This will clear all saved context
🔄 Current session will be lost
💾 Consider creating backup first
```

## 🔍 Discovery Commands

### SCAN RULES
**Purpose**: Scan project for rules and configuration files

**Usage**:
```bash
SCAN RULES
```

**What it finds**:
- All `.md` files in `rules/` directory
- Configuration files and documentation
- Project-specific guidelines

**Example Output**:
```
📁 Found 6 rules files:
├── DEVELOPMENT_RULES.md (45KB, 1141 lines)
├── TESTING_GUIDELINES.md (12KB, 287 lines)
├── CODE_STYLE.md (8KB, 195 lines)
└── ...
```

### FIND TASKS
**Purpose**: Discover TODO, FIXME, and incomplete tasks

**Usage**:
```bash
FIND TASKS
```

**Search Patterns**:
- `TODO`, `FIXME`, `HACK`, `NOTE` markers
- Incomplete checkboxes `- [ ]`
- Russian task markers: `нужно`, `требуется`, `добавить`, `исправить`

**Example Output**:
```
🔍 Task Discovery Results:
📝 TODO/FIXME: 4 items found
☑️ Incomplete checkboxes: 247 items found
🇷🇺 Russian markers: 156 items found

📋 Top Priority Items:
├── rules/DEVELOPMENT_RULES.md:88 - TODO: Implement real merge logic
├── memory-bank/tasks.md:45 - [ ] Complete Phase 4 testing
└── docs/README.md:12 - нужно обновить документацию
```

### INIT PROJECT
**Purpose**: Complete project initialization with full discovery

**Usage**:
```bash
INIT PROJECT
```

**Complete Process**:
1. Scans all project rules
2. Discovers all types of tasks
3. Analyzes project structure
4. Creates comprehensive context
5. Presents findings for user review

## 🔄 Mode-Specific Context Behavior

### VAN Mode Context
```yaml
Context Actions:
  - Create initial context file
  - Scan project for rules and tasks
  - Set complexity level
  - Initialize session metrics

Auto-Save Triggers:
  - Mode initialization complete
  - Task discovery finished
  - Complexity assessment done
```

### PLAN Mode Context
```yaml
Context Actions:
  - Update with planning details
  - Save strategy decisions
  - Record milestone definitions
  - Track planning progress

Auto-Save Triggers:
  - Plan creation complete
  - Strategy decisions made
  - Phase definitions finalized
```

### CREATIVE Mode Context
```yaml
Context Actions:
  - Save design decisions
  - Record architecture choices
  - Document technical selections
  - Track creative progress

Auto-Save Triggers:
  - Design decisions made
  - Architecture finalized
  - Technical choices confirmed
```

### IMPLEMENT Mode Context
```yaml
Context Actions:
  - Track code changes
  - Monitor build progress
  - Record implementation status
  - Save development state

Auto-Save Triggers:
  - Phase completion
  - Major code changes
  - Build milestones reached
```

### QA Mode Context
```yaml
Context Actions:
  - Record test results
  - Track bug reports
  - Monitor quality metrics
  - Save QA findings

Auto-Save Triggers:
  - Test completion
  - Bug discovery
  - Quality gates passed
```

### REFLECT Mode Context
```yaml
Context Actions:
  - Document lessons learned
  - Record insights
  - Capture improvements
  - Finalize project knowledge

Auto-Save Triggers:
  - Reflection completion
  - Knowledge capture done
  - Ready for archiving
```

## 📁 Context File Structure

### current-context.md Format
```markdown
# CURRENT CONTEXT STATE
**Last Updated**: 2025-06-20 14:30:00
**Status**: ACTIVE

## 🎯 CURRENT USER REQUEST
[Original user request that started the session]

## 🔧 CURRENT WORKING MODE
**Active Mode**: IMPLEMENT
**Phase**: Phase 3 of 4
**Complexity Level**: Level 3 (Intermediate Feature)

## 📋 TASK CONTEXT
**Task ID**: CONTEXT-MGMT-2025-06-20
**Task Name**: Context Management System Implementation
**Priority**: CRITICAL
**Progress**: 75%
**Next Steps**:
- Complete Phase 4: Integration Testing
- Update documentation
- Perform final validation

## 📊 SESSION METRICS
**Session Start**: 2025-06-20 12:15:00
**Active Time**: 2h 15m
**Mode Transitions**: 3
**Commands Executed**: 47
**Files Modified**: 12

## 📋 PROJECT RULES
[Discovered rules from rules/ directory]

## 📝 FOUND TASKS
[TODO/FIXME items and incomplete checkboxes]
```

## 🚨 Error Handling

### Context Corruption
**Symptoms**:
- CONTINUE command fails
- Context file unreadable
- Invalid format errors

**Recovery**:
```bash
# Check context file
cat memory-bank/system/current-context.md

# Clear corrupted context
CLEAR CONTEXT

# Restart with VAN mode
VAN
```

### Missing Context
**Symptoms**:
- No response to CONTINUE
- Context file missing
- Session state lost

**Recovery**:
```bash
# Verify file exists
ls -la memory-bank/system/

# Initialize new session
VAN

# Use project discovery
INIT PROJECT
```

### Interrupted Sessions
**Symptoms**:
- Unexpected termination
- Partial context save
- Incomplete state

**Recovery**:
```bash
# Attempt context restore
CONTINUE

# If fails, check last backup
ls -la memory-bank/backup/

# Manual recovery if needed
SHOW CONTEXT
CLEAR CONTEXT
VAN
```

## 🎯 Best Practices

### When to Use CONTINUE
✅ **Good uses**:
- After system restart
- Following interruption
- Resuming next day
- After context switch

❌ **Avoid using**:
- When starting new project
- After task completion
- With corrupted context
- For testing purposes

### Context Hygiene
🧹 **Regular maintenance**:
- Let system auto-clear completed contexts
- Use CLEAR CONTEXT only when necessary
- Monitor context file size
- Backup important states

### Performance Tips
⚡ **Optimization**:
- Keep context files under 50KB
- Clear old contexts regularly
- Use specific commands over generic ones
- Monitor session metrics

## 📊 Command Reference Quick Card

| Command | Purpose | When to Use |
|---------|---------|-------------|
| `CONTINUE` | Resume work | After interruption |
| `SHOW CONTEXT` | View current state | Check progress |
| `CLEAR CONTEXT` | Reset context | Start fresh |
| `SCAN RULES` | Find project rules | Project analysis |
| `FIND TASKS` | Discover tasks | Task planning |
| `INIT PROJECT` | Full initialization | New project setup |

## 🔗 Related Documentation

- [Architecture Overview](../architecture/context-management-architecture.md)
- [Workflow Diagrams](../architecture/workflow-diagrams.md)
- [System Rules](../../.cursor/rules/isolation_rules/Core/context-management.mdc)
- [Mode Instructions](../../custom_modes/)

This guide provides comprehensive coverage of Memory Bank's context management capabilities for seamless development continuity.