---
description: "Invariant validation methodology for Memory Bank development"
globs: "**/debugging/**", "**/validation/**", "**/testing/**"
alwaysApply: false
---

# INVARIANT VALIDATION METHODOLOGY

> **TL;DR:** Systematic approach to defining, implementing, and validating system invariants in Memory Bank development, ensuring system consistency and reliability.

```mermaid
graph TD
    Start["🔍 INVARIANT VALIDATION"] --> Define["📋 Define Invariants"]
    Define --> Implement["⚡ Implement Checks"]
    Implement --> Integrate["🔗 Integrate with System"]
    Integrate --> Monitor["👁️ Monitor Violations"]
    Monitor --> Report["📊 Report Issues"]
    Report --> Fix["🔧 Fix Violations"]
    Fix --> Verify["✅ Verify Resolution"]

    style Start fill:#d971ff,stroke:#a33bc2,color:white
    style Define fill:#4da6ff,stroke:#0066cc,color:white
    style Implement fill:#4dbb5f,stroke:#36873f,color:white
    style Monitor fill:#ffa64d,stroke:#cc7a30,color:white
```

## SYSTEM INVARIANTS

### Memory Bank Invariants:
1. **Task Consistency**: Active task always exists in tasks.md
2. **Mode Integrity**: Only one mode active at a time
3. **File Consistency**: All referenced files exist
4. **Status Coherence**: Task status matches actual state
5. **Context Preservation**: activeContext.md always current

### Validation Implementation:
```javascript
// Example invariant validation
function validateTaskConsistency() {
  const tasks = loadTasks();
  const activeTask = getActiveTask();

  assert(activeTask !== null, "Active task must exist");
  assert(tasks.includes(activeTask), "Active task must be in tasks list");
  assert(activeTask.status !== 'COMPLETED', "Active task cannot be completed");
}
```

## VERIFICATION CHECKLIST

```
✓ INVARIANT VALIDATION CHECKLIST
- System invariants identified and documented? [YES/NO]
- Validation functions implemented? [YES/NO]
- Invariant checks integrated into workflow? [YES/NO]
- Violation reporting mechanism in place? [YES/NO]
- Automated invariant testing configured? [YES/NO]
- Performance impact assessed? [YES/NO]
- Recovery procedures defined? [YES/NO]

→ If all YES: Invariant validation complete
→ If any NO: Complete missing validation elements
```

This methodology ensures system reliability through continuous invariant validation and violation detection.