---
description: Task status validation system for safe mode transitions
globs: "**/workflow/**", "**/validation/**", "**/status*/**"
alwaysApply: true
---

# TASK STATUS VALIDATION SYSTEM

> **TL;DR:** This system validates task completion status before mode transitions, preventing data loss and ensuring safe development workflow continuity.

## 🔍 VALIDATION OVERVIEW

The Task Status Validation System analyzes current task state and determines whether it's safe to transition between Memory Bank modes. It prevents critical issues like:

- Loss of unfinished implementation work
- Premature archiving of incomplete tasks
- Broken development workflow continuity
- Missing deliverables in transitions

## 📊 TASK STATUS CATEGORIES

### Status Definitions

**✅ COMPLETE**
- All requirements implemented
- Testing completed successfully
- Documentation updated
- Ready for archiving
- **Safe for all transitions**

**🔄 IN_PROGRESS**
- Active development underway
- Partial implementation exists
- Work context preserved
- **Requires migration for transitions**

**📋 PLANNED**
- Requirements defined
- Implementation plan ready
- No code changes yet
- **Requires migration for transitions**

**⛔ BLOCKED**
- Waiting for external dependencies
- Cannot proceed with current resources
- Context must be preserved
- **Requires migration for transitions**

**⏸️ ON_HOLD**
- Temporarily suspended
- May resume later
- Low priority preservation
- **Requires migration for transitions**

## 🔍 VALIDATION ALGORITHMS

### Completion Percentage Calculation

Tasks are evaluated across five dimensions with weighted importance:

- **Requirements** (10%): Task definition and acceptance criteria
- **Planning** (10%): Implementation strategy and approach
- **Implementation** (60%): Core development work
- **Testing** (15%): Verification and validation
- **Documentation** (5%): Knowledge capture and transfer

### Dependency Chain Analysis

The system analyzes task dependencies to identify:

- **Blocked By**: Tasks waiting for dependencies
- **Blocking**: Tasks that depend on current task
- **Critical Path**: Chain of dependent critical tasks

### Critical Path Detection

Identifies tasks that block system functionality:

- **CRITICAL Priority**: System-blocking issues
- **SYSTEM_BLOCKING Type**: Infrastructure dependencies
- **High Impact**: Tasks affecting multiple components

## 🚦 VALIDATION RULES BY MODE

### VAN Mode Validation

**Entry Requirements:**
- No specific requirements (initialization mode)

**Task Preservation Rules:**
- Check for existing tasks.md
- Validate migration.md if present
- Never delete existing task data
- Merge unfinished tasks from migration

**Validation Process:**
1. Check if migration.md exists
2. If yes: Process migration and merge tasks
3. If no: Check for existing tasks.md
4. If existing tasks found: Warn user about potential loss
5. Allow user to create migration or proceed with archiving

### REFLECT Mode Validation

**Entry Requirements:**
- Implementation must be complete
- All critical subtasks finished
- Deliverables ready for review

**Blocking Conditions:**
- Any CRITICAL task with status IN_PROGRESS
- Implementation completion < 90%
- Missing required deliverables
- Unresolved blocking dependencies

**Validation Process:**
1. Calculate overall implementation completion
2. Check critical task status
3. Verify deliverable readiness
4. If incomplete: Block transition and show warnings
5. If complete: Allow transition to REFLECT

### ARCHIVE Mode Validation

**Entry Requirements:**
- Reflection must be complete
- All deliverables documented
- Lessons learned captured
- System documentation updated

**Blocking Conditions:**
- Reflection not completed
- Missing deliverable documentation
- Unfinished documentation tasks
- Critical issues unresolved

**Validation Process:**
1. Verify reflection.md exists and is complete
2. Check all deliverables are documented
3. Validate system documentation updates
4. If incomplete: Block transition and show warnings
5. If complete: Create final migration and allow archiving

## ⚠️ WARNING SYSTEM INTEGRATION

### Warning Types and Triggers

**🚨 CRITICAL BLOCKING WARNING**
- **Trigger**: Critical tasks incomplete
- **Severity**: ERROR
- **Action**: Block transition
- **Message**: Lists critical tasks requiring completion

**⚠️ INCOMPLETE WORK WARNING**
- **Trigger**: Non-critical tasks incomplete
- **Severity**: WARNING
- **Action**: Require confirmation
- **Message**: Shows unfinished tasks and options

**🔗 DEPENDENCY WARNING**
- **Trigger**: Dependent tasks affected
- **Severity**: WARNING
- **Action**: Show impact analysis
- **Message**: Displays dependency chain impact

### Warning Display Format

```
╔═══════════════════════════════════════════════════════════════╗
║                    🚨 VALIDATION WARNING                      ║
╠═══════════════════════════════════════════════════════════════╣
║ Type: INCOMPLETE WORK                                         ║
║ Severity: WARNING                                             ║
║ Mode Transition: IMPLEMENT → REFLECT                         ║
╠═══════════════════════════════════════════════════════════════╣
║ Issues Found:                                                 ║
║ • Task TASK-CONTINUITY-FIX-2024-12-09: 75% complete          ║
║ • Task CREATIVE-ARCHIVE-SYSTEM-2024-12-09: 25% complete      ║
║                                                               ║
║ Recommendation:                                               ║
║ Create migration.md to preserve work context                  ║
╠═══════════════════════════════════════════════════════════════╣
║ Options:                                                      ║
║ [1] Create Migration (Recommended)                            ║
║ [2] Continue Implementation                                   ║
║ [3] Force Transition (NOT RECOMMENDED)                       ║
╚═══════════════════════════════════════════════════════════════╝
```

## 📋 VALIDATION CHECKLIST TEMPLATES

### Pre-REFLECT Validation Checklist

**Implementation**
- [ ] All planned features implemented
- [ ] Core functionality working
- [ ] Critical bugs resolved
- [ ] Code quality acceptable

**Testing**
- [ ] Unit tests passing
- [ ] Integration tests complete
- [ ] Performance acceptable
- [ ] Edge cases handled

**Documentation**
- [ ] Implementation documented
- [ ] API documentation updated
- [ ] User documentation current
- [ ] Technical decisions recorded

**Deliverables**
- [ ] All required files created
- [ ] Configuration updated
- [ ] Dependencies documented
- [ ] Deployment ready

### Pre-ARCHIVE Validation Checklist

**Reflection**
- [ ] reflection.md created
- [ ] Lessons learned documented
- [ ] Process improvements noted
- [ ] Technical insights captured

**Documentation**
- [ ] Implementation fully documented
- [ ] Architecture decisions recorded
- [ ] Testing results documented
- [ ] Performance metrics captured

**System Updates**
- [ ] System documentation updated
- [ ] Configuration changes documented
- [ ] Dependencies updated
- [ ] Migration path documented

**Knowledge Transfer**
- [ ] Key insights documented
- [ ] Future recommendations noted
- [ ] Maintenance procedures documented
- [ ] Support information updated

## 🔧 INTEGRATION WITH MEMORY BANK MODES

### File Integration Points

**tasks.md Integration**
- Read current task status
- Parse completion percentages
- Identify dependencies
- Extract priority levels

**progress.md Integration**
- Track implementation progress
- Monitor milestone completion
- Measure performance metrics
- Document status changes

**migration.md Integration**
- Create when validation fails
- Preserve task context
- Document incomplete work
- Plan continuation strategy

### Mode-Specific Integration

**VAN Mode Integration**
- Check for existing work before initialization
- Process migration documents if present
- Warn about potential task loss
- Merge unfinished tasks safely

**REFLECT Mode Integration**
- Validate implementation completion before reflection
- Check critical task status
- Calculate overall completion percentage
- Block unsafe transitions

**ARCHIVE Mode Integration**
- Validate reflection completion before archiving
- Check deliverable readiness
- Verify documentation completeness
- Create final migration documents

This validation system ensures safe transitions between all Memory Bank modes while preserving development work and maintaining workflow continuity.