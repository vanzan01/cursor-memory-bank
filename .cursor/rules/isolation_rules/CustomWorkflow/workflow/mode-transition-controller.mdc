---
description: Mode transition controller with task continuity integration
globs: "**/workflow/**", "**/transition/**", "**/controller*/**"
alwaysApply: true
---

# MODE TRANSITION CONTROLLER

> **TL;DR:** This controller manages safe transitions between Memory Bank modes, integrating task continuity validation, migration processing, and user confirmation workflows.

## 🔄 CONTROLLER OVERVIEW

The Mode Transition Controller acts as the central orchestrator for all Memory Bank mode transitions. It ensures:

- **Safe Transitions**: Validates readiness before mode changes
- **Data Preservation**: Prevents loss of unfinished work
- **User Guidance**: Provides clear options and recommendations
- **Context Continuity**: Maintains development state across transitions
- **Error Recovery**: Handles transition failures gracefully

## 🎯 CONTROLLER ARCHITECTURE

### Core Components

**Transition Validator**
- Validates current mode state
- Checks task completion status
- Analyzes dependency chains
- Assesses data loss risks

**Migration Processor**
- Creates migration documents
- Processes existing migrations
- Merges task contexts
- Preserves environment state

**User Interface**
- Displays warnings and options
- Collects user decisions
- Provides progress feedback
- Shows transition status

**State Manager**
- Tracks current mode state
- Manages transition history
- Maintains system consistency
- Handles rollback scenarios

## 🚦 TRANSITION WORKFLOWS

### VAN Mode Entry Process

When entering VAN mode, the controller:

1. **Check for Migration**: Look for existing migration.md
2. **Process Migration**: If found, validate and process migration
3. **Check Existing Tasks**: If no migration, check for existing tasks.md
4. **Warn User**: If unfinished tasks found, warn about potential loss
5. **User Decision**: Allow user to preserve, discard, or create migration
6. **Merge Context**: Combine migrated tasks with new requirements
7. **Initialize**: Complete VAN mode initialization

### REFLECT Mode Entry Process

When entering REFLECT mode, the controller:

1. **Validate Implementation**: Check implementation completion status
2. **Check Critical Tasks**: Ensure all critical tasks are complete
3. **Overall Completion**: Verify overall completion percentage
4. **Check Deliverables**: Validate required deliverables are ready
5. **User Warnings**: Show warnings for incomplete work
6. **Migration Option**: Offer migration creation for incomplete work
7. **Allow Entry**: Proceed to REFLECT mode if validated

### ARCHIVE Mode Entry Process

When entering ARCHIVE mode, the controller:

1. **Validate Reflection**: Ensure reflection.md exists and is complete
2. **Check Documentation**: Verify system documentation is updated
3. **Final Migration**: Create final migration document
4. **Archive Preparation**: Prepare all artifacts for archiving
5. **Knowledge Capture**: Ensure lessons learned are documented
6. **Clean Transition**: Complete archiving and prepare for next cycle

## 📋 TRANSITION VALIDATION RULES

### Implementation Completion Validation

**Critical Tasks**
- Threshold: 100% (Must be complete)
- Action: BLOCK transition
- Message: "Critical tasks must be completed before reflection"

**Overall Completion**
- Warning Threshold: 90%
- Blocking Threshold: 50%
- Action: WARN or BLOCK based on completion

**Deliverables**
- Required Files: implementation, tests, documentation
- Action: WARN (allow exceptions)
- User can document exceptions

### Reflection Completion Validation

**Reflection Document**
- Required: true
- Sections: summary, what_went_well, challenges, lessons_learned
- Action: BLOCK if missing

**System Documentation**
- Required: true
- Action: WARN (allow exceptions)
- User can document exceptions

**Knowledge Capture**
- Lessons Learned: REQUIRED
- Process Improvements: RECOMMENDED
- Technical Insights: RECOMMENDED

## 🔧 MIGRATION INTEGRATION

### Migration Creation Triggers

**Automatic Triggers**
- Incomplete critical tasks detected
- Overall completion < 90%
- User requests migration creation
- System detects data loss risk

**Manual Triggers**
- User explicitly requests migration
- Forced transition with warnings
- Emergency interruption scenarios
- Development context preservation

### Migration Processing Logic

The controller processes migrations through these steps:

1. **Validate Format**: Check migration document structure
2. **Extract Context**: Parse task and environment context
3. **Restore State**: Restore development environment
4. **Merge Tasks**: Combine migrated tasks with current tasks
5. **Update System**: Update system state with merged context
6. **Archive Migration**: Move processed migration to archive

## 🚨 ERROR HANDLING

### Transition Failure Recovery

**Migration Corruption**
- Detect corrupted migration documents
- Attempt automatic repair
- Fallback to backup migration
- User-guided recovery process

**State Inconsistency**
- Detect inconsistent system state
- Rollback to last known good state
- Preserve user work in emergency backup
- Guide manual resolution

**User Cancellation**
- Handle mid-transition cancellation
- Restore previous mode state
- Preserve any work in progress
- Clean up temporary files

### Error Recovery Process

The controller handles errors through:

1. **Error Detection**: Identify error type and severity
2. **Automatic Recovery**: Attempt automatic resolution
3. **Fallback Options**: Use backup systems if needed
4. **User Guidance**: Provide clear recovery instructions
5. **Emergency Backup**: Preserve work in emergency scenarios
6. **Escalation**: Escalate to manual recovery if needed

## 📊 TRANSITION MONITORING

### Success Metrics

**Transition Performance**
- Successful transition rate: >95%
- Migration processing time: <10 seconds
- User satisfaction scores: >4.5/5
- Data preservation rate: 100%

**Failure Metrics**
- Transition failure rate: <5%
- Error recovery time: <60 seconds
- Data loss incidents: 0
- User intervention required: <10%

### Performance Targets

**Transition Time**
- Target: < 30 seconds
- Warning: > 60 seconds
- Critical: > 120 seconds

**Migration Processing**
- Target: < 10 seconds
- Warning: > 30 seconds
- Critical: > 60 seconds

**User Response Time**
- Target: < 5 minutes
- Timeout: 15 minutes
- Escalation: 30 minutes

## 🔧 INTEGRATION POINTS

### File System Integration

**State Tracking**
- Current mode state in `memory-bank/mode-state.json`
- Transition history in `memory-bank/transition-history.log`
- Error logs in `memory-bank/transition-errors.log`

**Migration Management**
- Active migration in `memory-bank/migration.md`
- Migration archive in `memory-bank/archive/migrations/`
- Migration backups in `memory-bank/backup/migrations/`

### User Interface Integration

**Warning Display**
- Consistent warning message format
- Clear action buttons and options
- Progress indicators for long operations
- Help text and documentation links

**Feedback Collection**
- User satisfaction surveys
- Error reporting mechanisms
- Improvement suggestions
- Usage analytics

This Mode Transition Controller ensures safe, reliable transitions between all Memory Bank modes while preserving development work and maintaining user productivity.
