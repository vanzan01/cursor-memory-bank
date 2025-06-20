# Development: Debug Traces

## Current Debug Session
**Session ID**: Not Started
**Started**: TBD
**Status**: Not Started
**Issue Type**: TBD

## Debug Methodology (Rules #21-23)

### Rule #21: Трассировка перед исправлением ✅/❌
**Status**: ⏳ Ready for use
**Principle**: Always trace the issue before attempting fixes

#### Debug Workflow:
1. **Issue Identification**
   - [ ] Problem clearly described
   - [ ] Reproduction steps documented
   - [ ] Expected vs actual behavior defined

2. **Trace Collection**
   - [ ] Stack trace captured
   - [ ] Error logs collected
   - [ ] System state documented
   - [ ] Input data recorded

3. **Root Cause Analysis**
   - [ ] Trace path analyzed
   - [ ] Root cause identified
   - [ ] Contributing factors documented

4. **Solution Planning**
   - [ ] Fix strategy developed
   - [ ] Impact assessment completed
   - [ ] Test plan created

#### Trace Template:
```markdown
## Debug Trace: [Issue Name]
**Date**: [Date]
**Reporter**: [Name]
**Priority**: CRITICAL/HIGH/MEDIUM/LOW

### Problem Description
[Detailed description of the issue]

### Reproduction Steps
1. [Step 1]
2. [Step 2]
3. [Step 3]

### Expected Behavior
[What should happen]

### Actual Behavior
[What actually happens]

### Stack Trace
```
[Stack trace here]
```

### System State
- **Environment**: [Development/Staging/Production]
- **Platform**: [OS/Browser/Runtime]
- **Version**: [Application version]
- **Dependencies**: [Relevant dependency versions]

### Input Data
```
[Input data that caused the issue]
```

### Trace Analysis
[Analysis of the trace path and findings]

### Root Cause
[Identified root cause]

### Solution Strategy
[Planned fix approach]
```

### Rule #22: Детальное логирование ✅/❌
**Status**: ⏳ Ready for implementation
**Principle**: Implement comprehensive logging at appropriate levels

#### Logging Standards:
- **ERROR**: Critical failures that require immediate attention
- **WARN**: Potential issues that should be monitored
- **INFO**: General information about application flow
- **DEBUG**: Detailed information for debugging purposes
- **TRACE**: Very detailed execution information

#### Logging Template:
```typescript
// Structured logging pattern
const logger = {
  error: (message: string, context?: any, correlationId?: string) => {
    console.error(`[ERROR] ${new Date().toISOString()} [${correlationId}] ${message}`, context);
  },
  warn: (message: string, context?: any, correlationId?: string) => {
    console.warn(`[WARN] ${new Date().toISOString()} [${correlationId}] ${message}`, context);
  },
  info: (message: string, context?: any, correlationId?: string) => {
    console.info(`[INFO] ${new Date().toISOString()} [${correlationId}] ${message}`, context);
  },
  debug: (message: string, context?: any, correlationId?: string) => {
    console.debug(`[DEBUG] ${new Date().toISOString()} [${correlationId}] ${message}`, context);
  }
};
```

#### Logging Checklist:
- [ ] All error conditions logged with ERROR level
- [ ] Potential issues logged with WARN level
- [ ] Key application events logged with INFO level
- [ ] Debug information available for troubleshooting
- [ ] Correlation IDs used for request tracking
- [ ] Structured logging format maintained
- [ ] Sensitive data excluded from logs

### Rule #23: Валидация инвариантов ✅/❌
**Status**: ⏳ Ready for implementation
**Principle**: Define and validate system invariants

#### Invariant Categories:
1. **Data Invariants**: Constraints on data structure and content
2. **State Invariants**: Valid system states and transitions
3. **Business Invariants**: Business rule constraints
4. **Performance Invariants**: Performance and resource constraints

#### Invariant Template:
```typescript
// Invariant validation pattern
class InvariantValidator {
  static validateDataInvariant(data: any, rules: ValidationRule[]): boolean {
    for (const rule of rules) {
      if (!rule.validate(data)) {
        logger.error(`Data invariant violation: ${rule.description}`, { data, rule });
        return false;
      }
    }
    return true;
  }

  static validateStateInvariant(currentState: any, newState: any): boolean {
    // Validate state transition is valid
    if (!this.isValidStateTransition(currentState, newState)) {
      logger.error(`State invariant violation: invalid transition`, { currentState, newState });
      return false;
    }
    return true;
  }
}
```

#### Invariant Checklist:
- [ ] System invariants documented
- [ ] Invariant validation implemented
- [ ] Runtime invariant checking enabled
- [ ] Invariant violations logged and handled
- [ ] Recovery strategies defined for violations

## Debug Session Templates

### Template: Quick Bug Fix (Level 1)
```markdown
## Debug Session: Quick Fix
**Issue**: [Brief description]
**Priority**: CRITICAL/HIGH
**Estimated Time**: Minutes to hours

### Quick Trace:
1. **Symptom**: [What's wrong]
2. **Location**: [Where the issue occurs]
3. **Cause**: [Root cause]
4. **Fix**: [Solution applied]

### Validation:
- [ ] Fix applied
- [ ] Issue resolved
- [ ] No regression introduced
- [ ] Logs updated
```

### Template: Complex Investigation (Level 2-4)
```markdown
## Debug Session: Complex Investigation
**Issue**: [Detailed description]
**Priority**: CRITICAL/HIGH/MEDIUM
**Estimated Time**: Hours to days

### Investigation Plan:
1. **Data Collection**
   - [ ] Logs collected
   - [ ] Stack traces captured
   - [ ] System metrics gathered
   - [ ] User reports analyzed

2. **Analysis Phase**
   - [ ] Trace path mapped
   - [ ] Dependencies analyzed
   - [ ] State transitions examined
   - [ ] Performance impact assessed

3. **Root Cause Identification**
   - [ ] Primary cause identified
   - [ ] Contributing factors documented
   - [ ] Impact scope determined

4. **Solution Development**
   - [ ] Fix strategy developed
   - [ ] Alternative approaches considered
   - [ ] Risk assessment completed
   - [ ] Test plan created

5. **Implementation & Validation**
   - [ ] Fix implemented
   - [ ] Tests executed
   - [ ] Regression testing completed
   - [ ] Performance impact validated
```

## Debug Trace History

### Active Traces
*No active debug traces*

### Completed Traces
*No completed debug traces yet*

### Trace Statistics
- **Total Traces**: 0
- **Resolved**: 0
- **In Progress**: 0
- **Average Resolution Time**: N/A

## Integration with Memory Bank Modes

### IMPLEMENT Mode Integration
- Automatic trace collection on errors
- Real-time logging during development
- Invariant validation during code execution

### QA Mode Integration
- Comprehensive trace analysis
- Log validation and review
- Invariant testing and verification

### REFLECT Mode Integration
- Debug session analysis and documentation
- Lessons learned from debug traces
- Process improvement recommendations

## Debug Tools Configuration

### Bun Debug Configuration
```json
{
  "scripts": {
    "debug": "bun --inspect run src/index.ts",
    "debug:test": "bun --inspect test",
    "trace": "bun run --trace-warnings src/index.ts"
  }
}
```

### Debug Environment Setup
```bash
# Enable debug logging
export DEBUG=*
export NODE_ENV=development

# Run with debugging
bun --inspect --trace-warnings run src/index.ts
```

## Common Debug Patterns

### Memory Leak Detection
```typescript
// Memory usage monitoring
const memoryUsage = process.memoryUsage();
logger.info('Memory usage', {
  rss: `${Math.round(memoryUsage.rss / 1024 / 1024)} MB`,
  heapTotal: `${Math.round(memoryUsage.heapTotal / 1024 / 1024)} MB`,
  heapUsed: `${Math.round(memoryUsage.heapUsed / 1024 / 1024)} MB`,
  external: `${Math.round(memoryUsage.external / 1024 / 1024)} MB`
});
```

### Performance Bottleneck Detection
```typescript
// Performance monitoring
const start = performance.now();
// ... operation to measure
const duration = performance.now() - start;
if (duration > 100) { // Threshold: 100ms
  logger.warn('Performance bottleneck detected', { operation: 'operationName', duration });
}
```

### Error Boundary Pattern
```typescript
// Error handling with trace
try {
  // Risky operation
} catch (error) {
  logger.error('Operation failed', {
    error: error.message,
    stack: error.stack,
    context: { /* relevant context */ }
  });
  // Handle error appropriately
}
```