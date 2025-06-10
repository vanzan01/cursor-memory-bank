---
description: "Warning system for Memory Bank mode transitions and data protection"
globs: "**/workflow/**", "**/warning-system/**", "**/validation/**"
alwaysApply: true
---

# WARNING SYSTEM

> **TL;DR:** Comprehensive warning system that prevents data loss and guides safe Memory Bank mode transitions through intelligent validation and user notifications.

## 🚨 WARNING SYSTEM OVERVIEW

The Warning System acts as a safety net for Memory Bank operations, detecting potential issues before they cause problems and providing clear guidance to users.

### Core Functions

**Data Protection**
- Detect unfinished work before mode transitions
- Warn about potential data loss scenarios
- Validate task completion status
- Check file system integrity

**User Guidance**
- Provide clear warning messages
- Offer actionable solutions
- Guide safe mode transitions
- Explain consequences of actions

## ⚠️ WARNING CATEGORIES

### 🔴 CRITICAL WARNINGS (Block Action)

**Data Loss Prevention**
```bash
╔═══════════════════════════════════════════════════════════════╗
║                    🚨 CRITICAL WARNING                        ║
╠═══════════════════════════════════════════════════════════════╣
║ Type: DATA LOSS RISK                                         ║
║ Severity: CRITICAL                                            ║
║ Action: BLOCKED                                               ║
╠═══════════════════════════════════════════════════════════════╣
║ Issue: Unfinished critical tasks detected                    ║
║ Risk: Work will be lost without migration                    ║
║                                                               ║
║ Affected Tasks:                                               ║
║ • TASK-CRITICAL-2025-06-10: 75% complete                     ║
║ • SYSTEM-INTEGRATION-2025-06-10: 50% complete                ║
╠═══════════════════════════════════════════════════════════════╣
║ Required Actions:                                             ║
║ [1] Complete critical tasks                                   ║
║ [2] Create migration document                                 ║
║ [3] Archive current work                                      ║
╚═══════════════════════════════════════════════════════════════╝
```

**System Integrity Issues**
```bash
╔═══════════════════════════════════════════════════════════════╗
║                    🚨 SYSTEM ERROR                            ║
╠═══════════════════════════════════════════════════════════════╣
║ Type: SYSTEM INTEGRITY                                        ║
║ Severity: CRITICAL                                            ║
║ Action: BLOCKED                                               ║
╠═══════════════════════════════════════════════════════════════╣
║ Issue: Required system files missing                         ║
║ Risk: System malfunction or data corruption                  ║
║                                                               ║
║ Missing Files:                                                ║
║ • memory-bank/tasks.md                                        ║
║ • memory-bank/system/current-date.txt                        ║
╠═══════════════════════════════════════════════════════════════╣
║ Required Actions:                                             ║
║ [1] Restore missing files                                     ║
║ [2] Verify system integrity                                   ║
║ [3] Run system validation                                     ║
╚═══════════════════════════════════════════════════════════════╝
```

### 🟡 HIGH WARNINGS (Require Confirmation)

**Incomplete Work Warning**
```bash
╔═══════════════════════════════════════════════════════════════╗
║                    ⚠️ HIGH WARNING                            ║
╠═══════════════════════════════════════════════════════════════╣
║ Type: INCOMPLETE WORK                                         ║
║ Severity: HIGH                                                ║
║ Action: CONFIRMATION REQUIRED                                 ║
╠═══════════════════════════════════════════════════════════════╣
║ Issue: Non-critical tasks incomplete                         ║
║ Risk: Work progress may be lost                              ║
║                                                               ║
║ Incomplete Tasks:                                             ║
║ • ENHANCEMENT-FEATURE-2025-06-10: 80% complete               ║
║ • DOCUMENTATION-UPDATE-2025-06-10: 60% complete              ║
╠═══════════════════════════════════════════════════════════════╣
║ Options:                                                      ║
║ [1] Continue and create migration (Recommended)               ║
║ [2] Complete tasks first                                      ║
║ [3] Proceed anyway (NOT RECOMMENDED)                         ║
╚═══════════════════════════════════════════════════════════════╝
```

### 🔵 MEDIUM WARNINGS (Informational)

**Best Practice Recommendations**
```bash
╔═══════════════════════════════════════════════════════════════╗
║                    ℹ️ RECOMMENDATION                          ║
╠═══════════════════════════════════════════════════════════════╣
║ Type: BEST PRACTICE                                           ║
║ Severity: MEDIUM                                              ║
║ Action: OPTIONAL                                              ║
╠═══════════════════════════════════════════════════════════════╣
║ Suggestion: Consider creating backup before proceeding       ║
║ Benefit: Additional safety for your work                     ║
║                                                               ║
║ Recommended Actions:                                          ║
║ • Create git commit with current progress                    ║
║ • Update documentation                                        ║
║ • Review task priorities                                      ║
╠═══════════════════════════════════════════════════════════════╣
║ Options:                                                      ║
║ [1] Follow recommendations                                    ║
║ [2] Proceed without changes                                   ║
╚═══════════════════════════════════════════════════════════════╝
```

## 🔍 WARNING TRIGGERS

### Mode Transition Triggers

**VAN Mode Entry**
- Existing tasks.md found without migration
- Unfinished work detected
- System files missing or corrupted

**REFLECT Mode Entry**
- Implementation not complete (< 90%)
- Critical tasks still in progress
- Required deliverables missing

**ARCHIVE Mode Entry**
- Reflection not completed
- Documentation incomplete
- System updates not finalized

### File Operation Triggers

**File Modification**
- Attempting to modify read-only files
- Overwriting important system files
- Deleting files with unsaved changes

**Directory Operations**
- Creating directories in protected areas
- Removing non-empty directories
- Moving critical system directories

## 🛠️ WARNING IMPLEMENTATION

### Warning Detection Logic

```typescript
// Warning detection interface
interface WarningDetector {
  checkCondition(): boolean;
  getWarningLevel(): 'CRITICAL' | 'HIGH' | 'MEDIUM' | 'LOW';
  getWarningMessage(): WarningMessage;
  getSuggestedActions(): Action[];
}

// Example: Task completion warning
class TaskCompletionWarning implements WarningDetector {
  checkCondition(): boolean {
    const incompleteTasks = getIncompleteTasks();
    return incompleteTasks.some(task => task.priority === 'CRITICAL');
  }

  getWarningLevel(): 'CRITICAL' {
    return 'CRITICAL';
  }

  getWarningMessage(): WarningMessage {
    return {
      type: 'DATA_LOSS_RISK',
      title: 'Critical tasks incomplete',
      description: 'Unfinished critical tasks will be lost',
      affectedItems: getIncompleteCriticalTasks()
    };
  }

  getSuggestedActions(): Action[] {
    return [
      { id: 'complete_tasks', label: 'Complete critical tasks' },
      { id: 'create_migration', label: 'Create migration document' },
      { id: 'archive_work', label: 'Archive current work' }
    ];
  }
}
```

### Warning Display System

```typescript
// Warning display configuration
const warningDisplayConfig = {
  critical: {
    color: 'red',
    icon: '🚨',
    blockAction: true,
    requireConfirmation: false
  },
  high: {
    color: 'yellow',
    icon: '⚠️',
    blockAction: false,
    requireConfirmation: true
  },
  medium: {
    color: 'blue',
    icon: 'ℹ️',
    blockAction: false,
    requireConfirmation: false
  }
};
```

## 📋 WARNING VALIDATION RULES

### Pre-Transition Validation

**VAN Mode Validation**
```bash
# Check for existing work
if [ -f "memory-bank/tasks.md" ] && [ ! -f "memory-bank/migration.md" ]; then
  echo "WARNING: Existing tasks found without migration"
  echo "Risk: Current work may be lost"
  echo "Action: Create migration or archive existing work"
fi
```

**REFLECT Mode Validation**
```bash
# Check implementation completion
COMPLETION=$(grep -o "completion: [0-9]*%" memory-bank/tasks.md | tail -1 | grep -o "[0-9]*")
if [ "$COMPLETION" -lt 90 ]; then
  echo "WARNING: Implementation not complete ($COMPLETION%)"
  echo "Risk: Premature reflection may miss important details"
  echo "Action: Complete implementation or document reasons"
fi
```

**ARCHIVE Mode Validation**
```bash
# Check reflection completion
if [ ! -f "memory-bank/reflection/reflection-$(date +%Y-%m-%d).md" ]; then
  echo "WARNING: Reflection not completed"
  echo "Risk: Knowledge and lessons may be lost"
  echo "Action: Complete reflection before archiving"
fi
```

### File System Validation

**Critical File Protection**
```bash
# Protect critical system files
CRITICAL_FILES=(
  "memory-bank/tasks.md"
  "memory-bank/system/current-date.txt"
  "memory-bank/system/interaction-mode.txt"
  "memory-bank/config/system.yaml"
)

for file in "${CRITICAL_FILES[@]}"; do
  if [ ! -f "$file" ]; then
    echo "CRITICAL: Missing system file: $file"
    echo "Action: Restore file or run system initialization"
  fi
done
```

## 🔄 WARNING RESPONSE WORKFLOW

### User Response Handling

```mermaid
graph TD
    Warning["⚠️ Warning Triggered"] --> Display["📺 Display Warning"]
    Display --> UserChoice{"👤 User Choice"}

    UserChoice -->|"Fix Issues"| Fix["🔧 Fix Problems"]
    UserChoice -->|"Create Migration"| Migrate["📝 Create Migration"]
    UserChoice -->|"Proceed Anyway"| Override["⚠️ Override Warning"]

    Fix --> Validate["✅ Re-validate"]
    Migrate --> Validate
    Override --> Log["📝 Log Override"]

    Validate --> Success{"✅ Validation Passed?"}
    Success -->|"Yes"| Proceed["▶️ Proceed with Action"]
    Success -->|"No"| Display

    Log --> Proceed

    style Warning fill:#ffa64d,stroke:#cc7a30,color:white
    style Display fill:#4da6ff,stroke:#0066cc,color:white
    style Fix fill:#4dbb5f,stroke:#36873f,color:white
    style Override fill:#ff5555,stroke:#cc0000,color:white
    style Proceed fill:#5fd94d,stroke:#3da336,color:white
```

### Automatic Resolution

**Auto-Fix Capabilities**
- Create missing system files with defaults
- Initialize empty configuration files
- Restore corrupted date files
- Fix simple file permission issues

**Auto-Migration**
- Detect unfinished work patterns
- Create basic migration documents
- Preserve task context automatically
- Backup current state before changes

## 📊 WARNING METRICS

### Warning Effectiveness

**Prevention Metrics**
- Data loss incidents prevented: Target 100%
- User errors caught: Target >95%
- System integrity maintained: Target 100%
- Successful recoveries: Target >90%

**User Experience Metrics**
- Warning clarity score: Target >4.5/5
- Resolution success rate: Target >85%
- User satisfaction: Target >4.0/5
- Time to resolution: Target <5 minutes

### Warning Quality

**Message Quality**
- Clear problem description: Required
- Actionable solutions provided: Required
- Risk level clearly communicated: Required
- Multiple resolution options: Preferred

**System Integration**
- Consistent warning format: Required
- Proper severity classification: Required
- Integration with all modes: Required
- Comprehensive coverage: Target >95%

This warning system ensures safe Memory Bank operations by proactively detecting issues and guiding users toward safe resolutions.