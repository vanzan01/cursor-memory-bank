---
description: "Detailed logging methodology for Memory Bank development"
globs: "**/debugging/**", "**/logging/**", "**/trace/**"
alwaysApply: false
---

# DETAILED LOGGING METHODOLOGY

> **TL;DR:** Comprehensive logging strategy for Memory Bank development, ensuring effective debugging, monitoring, and system analysis through structured logging practices.

```mermaid
graph TD
    Start["📝 LOGGING ACTIVATION"] --> Strategy["📋 Define Logging Strategy"]
    Strategy --> Levels["🎯 Set Log Levels"]
    Levels --> Structure["🏗️ Structure Log Messages"]
    Structure --> Implement["⚡ Implement Logging"]
    Implement --> Monitor["👁️ Monitor Logs"]
    Monitor --> Analyze["📊 Analyze Patterns"]
    Analyze --> Optimize["🔧 Optimize Logging"]

    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style Strategy fill:#ffa64d,stroke:#cc7a30,color:white
    style Implement fill:#4dbb5f,stroke:#36873f,color:white
    style Analyze fill:#d971ff,stroke:#a33bc2,color:white
```

## LOGGING STRATEGY

### Log Levels:
1. **ERROR**: Critical errors requiring immediate attention
2. **WARN**: Warning conditions that should be monitored
3. **INFO**: General information about system operation
4. **DEBUG**: Detailed information for debugging
5. **TRACE**: Very detailed execution flow information

### Structured Logging Format:
```json
{
  "timestamp": "2024-12-10T09:24:00.000Z",
  "level": "INFO",
  "component": "memory-bank",
  "operation": "task-processing",
  "message": "Task completed successfully",
  "context": {
    "taskId": "RULES-INT-2024-12-09",
    "phase": "implementation",
    "duration": 1200
  }
}
```

## MEMORY BANK INTEGRATION

### Core Logging Areas:
- **Mode Transitions**: VAN → PLAN → IMPLEMENT → REFLECT
- **Task Processing**: Task creation, updates, completion
- **File Operations**: File reads, writes, modifications
- **Command Execution**: All terminal commands and results
- **Error Conditions**: Failures, exceptions, recovery

### Log File Organization:
```
memory-bank/logs/
├── system.log (general system operations)
├── tasks.log (task-specific operations)
├── modes.log (mode transition logs)
├── commands.log (command execution logs)
└── errors.log (error and exception logs)
```

## VERIFICATION CHECKLIST

```
✓ DETAILED LOGGING CHECKLIST
- Logging strategy defined? [YES/NO]
- Log levels appropriately set? [YES/NO]
- Structured logging format implemented? [YES/NO]
- All critical operations logged? [YES/NO]
- Log files organized properly? [YES/NO]
- Log rotation configured? [YES/NO]
- Performance impact minimized? [YES/NO]
- Log analysis tools available? [YES/NO]

→ If all YES: Logging system complete
→ If any NO: Complete missing logging elements
```

This methodology ensures comprehensive logging for effective debugging and system monitoring in Memory Bank development.