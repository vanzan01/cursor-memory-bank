---
description: Enhanced Context Management with Per-Task Context Preservation
globs: "**/memory-bank/**", "**/contexts/**", "**/tasks/**"
alwaysApply: true
---

# ENHANCED CONTEXT MANAGEMENT SYSTEM

## CORE PRINCIPLE: PER-TASK CONTEXT PRESERVATION

**CRITICAL REQUIREMENT**: Each task MUST have separate context preservation to enable multi-task switching and parallel work on non-overlapping tasks.

**MANDATORY RULE**: NO static context files (like current-context.md). ALL contexts MUST be task-specific and follow YYYY-MM-DD-task-name-context.md format.

## CONTEXT ARCHITECTURE

### Context File Structure
```
New Structure:
memory-bank/tasks/
├── todo/{YYYY-MM-DD_ID-XXX_task-name}/_context.md
├── in_progress/{YYYY-MM-DD_ID-XXX_task-name}/_context.md
└── done/{YYYY-MM-DD_ID-XXX_task-name}/_context.md
```

### Context Naming Convention
```
Format: YYYY-MM-DD-{task-identifier}-context.md
Examples:
- 2025-06-20-user-authentication-context.md
- 2025-06-20-payment-integration-context.md
- 2025-06-20-ui-redesign-context.md
```

## CONTEXT PRESERVATION REQUIREMENTS

### Mental State Preservation
```markdown
## 🧠 MENTAL STATE

### Current Focus
- **Primary Objective**: [What you're trying to achieve]
- **Current Approach**: [How you're approaching it]
- **Mental Model**: [Your understanding of the problem/solution]

### Cognitive Context
- **Key Insights**: [Important realizations or discoveries]
- **Assumptions Made**: [What you're assuming to be true]
- **Questions to Resolve**: [Open questions or uncertainties]
- **Decision Points**: [Choices that need to be made]

### Emotional State
- **Confidence Level**: [HIGH/MEDIUM/LOW]
- **Frustration Points**: [What's been challenging]
- **Momentum Indicators**: [What's working well]
```

### Working State Preservation
```markdown
## ⚙️ WORKING STATE

### Technical Context
- **Current File/Location**: [Where you're working]
- **Code/Config State**: [What's been modified]
- **Environment Setup**: [Tools, terminals, browsers open]
- **Dependencies**: [What needs to be running/available]

### Progress Tracking
- **Completed Steps**: [What's been finished]
- **Current Step**: [What you're working on now]
- **Next Steps**: [Immediate next actions]
- **Blocked Items**: [What's preventing progress]

### Research Context
- **Sources Consulted**: [Documentation, Stack Overflow, etc.]
- **Key Findings**: [Important information discovered]
- **Approaches Tried**: [What's been attempted]
- **Approaches to Try**: [What to attempt next]
```

### Session Planning
```markdown
## 📋 SESSION PLANNING

### Recovery Procedure
1. **Environment Setup**: [Steps to recreate working environment]
2. **Context Loading**: [How to get back into the mental state]
3. **Progress Review**: [Quick review of what's been done]
4. **Next Action**: [First thing to do when resuming]

### Time Management
- **Estimated Time Remaining**: [How much more work expected]
- **Optimal Session Length**: [Best work session duration]
- **Break Points**: [Good places to pause work]
- **Dependencies on Others**: [Waiting for external input]
```

## WIP (WORK IN PROGRESS) LIMITS

### Active Context Limits
```yaml
Maximum Active Contexts: 3
Reasoning:
  - Human cognitive limit for context switching
  - 25-minute recovery time per context switch
  - Quality degradation with too many active contexts
  - Memory and attention span constraints
```

### Context State Management
```markdown
Context States:
- **ACTIVE**: Currently being worked on (max 3)
- **SUSPENDED**: Temporarily paused, can be resumed
- **BLOCKED**: Waiting for external dependencies
- **ARCHIVED**: Completed or permanently shelved
```

## CONTEXT SWITCHING PROTOCOLS

### Suspension Protocol
```bash
# When suspending a context
suspend_context() {
    local context_file=$(get_context_file_path)
    if [ -z "$context_file" ]; then
      echo "❌ No active task found. Cannot suspend context." >&2
      return 1
    fi
    local reason="$1"

    echo "## 🔄 CONTEXT SUSPENSION" >> "$context_file"
    echo "**Suspended At**: $(date '+%Y-%m-%d %H:%M:%S')" >> "$context_file"
    echo "**Reason**: $reason" >> "$context_file"
    echo "**Recovery Notes**: [Add specific notes for resuming]" >> "$context_file"

    # No longer moving directories, just updating the content
}
```

### Restoration Protocol
```bash
# When restoring a suspended context
restore_context() {
    local context_file=$(get_context_file_path)
    if [ -z "$context_file" ]; then
      echo "❌ No active task found. Cannot restore context." >&2
      return 1
    fi

    echo "## ▶️ CONTEXT RESTORATION" >> "$context_file"
    echo "**Restored At**: $(date '+%Y-%m-%d %H:%M:%S')" >> "$context_file"
    echo "**Recovery Time**: [Time taken to get back into flow]" >> "$context_file"

    # No longer moving directories, just updating the content
}
```

### Context Dashboard
```markdown
# Context Dashboard Template
## 📊 ACTIVE CONTEXTS DASHBOARD

**Last Updated**: 2025-06-20 19:45:00
**Active Contexts**: Dynamic (based on current-task.txt)

### 🟢 Active Context
| Context | Priority | Progress | Last Updated | Next Action |
|---------|----------|----------|--------------|-------------|
| [Current Task Context](_context.md) | N/A | N/A | N/A | N/A |

### ⏸️ Suspended Contexts
| Context | Reason | Suspended Since | Resume Priority |
|---------|--------|-----------------|-----------------|
| *No longer managed via separate files, review task directory for status.* |

### ⚠️ Context Health Alerts
- [ ] Active context exists if a task is active ✅
- [ ] Active context updated regularly (manual check) ✅
```

## INTEGRATION WITH TASK MANAGEMENT

### Task-Context Linking
```markdown
# In task files (_task.md):
**Related Context**: [_context.md](_context.md)

# In context files (_context.md):
**Related Task**: [_task.md](_task.md)
```

### Context Lifecycle Management
```bash
# Context lifecycle automation
manage_context_lifecycle() {
    local task_status="$1"
    local task_path=$(get_active_task_path)
    if [ -z "$task_path" ]; then
      echo "❌ No active task found. Cannot manage context lifecycle." >&2
      return 1
    fi
    local context_file="$task_path/_context.md"

    case "$task_status" in
        "started")
            # For a new task, _context.md is created during task directory setup
            # We just need to ensure it's loaded implicitly by active-task-manager
            echo "New task started, context at $context_file initialized."
            ;;
        "suspended")
            suspend_context "Task suspended for manual review"
            ;;
        "resumed")
            restore_context
            ;;
        "completed")
            echo "Context for $task_path marked as completed (manual archival needed)" # Context remains in task directory, manual archival of entire task directory
            ;;
        "cancelled")
            echo "Context for $task_path marked as cancelled (manual archival needed)" # Context remains in task directory, manual archival of entire task directory
            ;;
    esac
}
```

## MODE-SPECIFIC CONTEXT REQUIREMENTS

### VAN Mode Context
```markdown
VAN Context Requirements:
- Preserve analysis state and findings
- Track migration progress and decisions
- Document discovered patterns and issues
- Maintain investigation context across sessions
```

### PLAN Mode Context
```markdown
PLAN Context Requirements:
- Preserve strategic thinking and decisions
- Track component analysis progress
- Document research findings and sources
- Maintain planning assumptions and constraints
```

### CREATIVE Mode Context
```markdown
CREATIVE Context Requirements:
- Preserve design thinking and iterations
- Track option evaluation and decisions
- Document inspiration sources and references
- Maintain creative flow and momentum
```

### IMPLEMENT Mode Context
```markdown
IMPLEMENT Context Requirements:
- Preserve technical implementation state
- Track code changes and debugging progress
- Document technical decisions and trade-offs
- Maintain development environment context
```

## CONTEXT QUALITY ASSURANCE

### Context Health Checks
```bash
# Daily context health check
check_context_health() {
    local active_contexts=$(find memory-bank/contexts/active -name "*.md" | wc -l)
    local stale_contexts=$(find memory-bank/contexts/active -name "*.md" -mtime +1)

    if [[ $active_contexts -gt 3 ]]; then
        echo "⚠️ WIP LIMIT EXCEEDED: $active_contexts active contexts (max 3)"
    fi

    if [[ -n "$stale_contexts" ]]; then
        echo "⚠️ STALE CONTEXTS DETECTED:"
        echo "$stale_contexts"
    fi
}
```

### Context Validation
```bash
# Validate context file completeness
validate_context() {
    local context_file="$1"
    local required_sections=("MENTAL STATE" "WORKING STATE" "SESSION PLANNING")

    for section in "${required_sections[@]}"; do
        if ! grep -q "$section" "$context_file"; then
            echo "❌ MISSING SECTION: $section in $context_file"
        fi
    done
}
```

## CONTEXT MIGRATION AND ARCHIVAL

### Automatic Archival
```bash
# Archive completed contexts
archive_completed_contexts() {
    local completed_tasks=$(find memory-bank/tasks/done -name "*.md" -mtime -1)

    for task_file in $completed_tasks; do
        local task_name=$(basename "$task_file" .md)
        local context_file="memory-bank/contexts/active/${task_name}-context.md"

        if [[ -f "$context_file" ]]; then
            local archive_dir="memory-bank/contexts/archived/$(date +%Y-%m)"
            mkdir -p "$archive_dir"
            mv "$context_file" "$archive_dir/"
        fi
    done
}
```

### Context Search and Recovery
```bash
# Search contexts by content
search_contexts() {
    local search_term="$1"
    echo "🔍 Searching contexts for: $search_term"

    find memory-bank/contexts -name "*.md" -exec grep -l "$search_term" {} \;
}

# Recover archived context
recover_context() {
    local context_name="$1"
    local archived_context=$(find memory-bank/contexts/archived -name "*$context_name*")

    if [[ -n "$archived_context" ]]; then
        cp "$archived_context" "memory-bank/contexts/active/"
        echo "✅ Context recovered: $archived_context"
    fi
}
```

## PERFORMANCE OPTIMIZATION

### Context Switching Cost Mitigation
```markdown
Strategies to Reduce 25-Minute Context Switch Cost:

1. **Detailed State Preservation**
   - Complete mental state documentation
   - Specific next-action identification
   - Environment recreation instructions

2. **Quick Context Loading**
   - Summary sections for rapid review
   - Visual cues and mnemonics
   - Progress indicators and milestones

3. **Gradual Context Building**
   - Start with simple tasks in new context
   - Build complexity gradually
   - Use warm-up exercises

4. **Context Boundaries**
   - Clear separation between contexts
   - Avoid context bleeding
   - Use physical/temporal boundaries
```

### Context Efficiency Metrics
```bash
# Track context switching efficiency
track_context_efficiency() {
    local context_file="$1"
    local switch_time="$2"

    echo "## 📊 CONTEXT METRICS" >> "$context_file"
    echo "**Switch Time**: $switch_time minutes" >> "$context_file"
    echo "**Recovery Quality**: [HIGH/MEDIUM/LOW]" >> "$context_file"
    echo "**Productivity Impact**: [POSITIVE/NEUTRAL/NEGATIVE]" >> "$context_file"
}
```

## CRITICAL SUCCESS FACTORS

1. **Disciplined Context Management**: Consistent use of context preservation
2. **WIP Limit Enforcement**: Never exceed 3 active contexts
3. **Quality Documentation**: Detailed and actionable context information
4. **Regular Context Health Checks**: Daily validation and cleanup
5. **Context-Task Integration**: Seamless linking between tasks and contexts

This enhanced context management system enables efficient multi-task work while preserving the quality and continuity of work across context switches.
