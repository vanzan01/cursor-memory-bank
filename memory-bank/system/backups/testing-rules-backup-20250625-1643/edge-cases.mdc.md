---
description: "Edge case testing rules and methodologies for Memory Bank development"
globs: "**/testing/**", "**/edge-cases/**", "**/boundary-testing/**"
alwaysApply: false
---

# EDGE CASE TESTING RULES

> **TL;DR:** This rule defines comprehensive edge case testing methodologies for Memory Bank development, ensuring robust handling of boundary conditions and exceptional scenarios.

## 🎯 EDGE CASE TESTING OVERVIEW

Edge case testing focuses on boundary conditions, exceptional inputs, and unusual scenarios that could cause system failures or unexpected behavior in Memory Bank operations.

### Core Principles

**Boundary Testing**
- Test minimum and maximum values
- Test empty and null inputs
- Test oversized inputs
- Test invalid data types

**Exception Scenarios**
- Network failures during operations
- File system errors
- Memory limitations
- Concurrent access conflicts

## 📋 EDGE CASE CATEGORIES

### 1. Input Validation Edge Cases

**Empty Inputs**
```bash
# Test empty task descriptions
bun test --grep "empty task description"

# Test empty file paths
bun test --grep "empty file path"

# Test empty configuration
bun test --grep "empty config"
```

**Oversized Inputs**
```bash
# Test very long task names (>1000 chars)
bun test --grep "oversized task name"

# Test large file uploads
bun test --grep "large file handling"

# Test massive task lists
bun test --grep "massive task list"
```

**Invalid Data Types**
```bash
# Test string where number expected
bun test --grep "invalid data type"

# Test null where object expected
bun test --grep "null object handling"

# Test array where string expected
bun test --grep "array string mismatch"
```

### 2. File System Edge Cases

**Permission Issues**
```bash
# Test read-only file modification
bun test --grep "readonly file"

# Test missing directory creation
bun test --grep "missing directory"

# Test disk space exhaustion
bun test --grep "disk space"
```

**Path Edge Cases**
```bash
# Test very long file paths
bun test --grep "long file path"

# Test special characters in paths
bun test --grep "special chars path"

# Test relative vs absolute paths
bun test --grep "path resolution"
```

### 3. Memory Bank Mode Edge Cases

**Mode Transition Edge Cases**
```bash
# Test transition with incomplete tasks
bun test --grep "incomplete transition"

# Test rapid mode switching
bun test --grep "rapid mode switch"

# Test transition during file operations
bun test --grep "transition during operation"
```

**Task Management Edge Cases**
```bash
# Test circular task dependencies
bun test --grep "circular dependency"

# Test task ID conflicts
bun test --grep "task id conflict"

# Test task status corruption
bun test --grep "status corruption"
```

### 4. Concurrency Edge Cases

**Simultaneous Operations**
```bash
# Test concurrent file writes
bun test --grep "concurrent writes"

# Test simultaneous mode transitions
bun test --grep "simultaneous transitions"

# Test parallel task creation
bun test --grep "parallel task creation"
```

**Race Conditions**
```bash
# Test file lock conflicts
bun test --grep "file lock conflict"

# Test shared resource access
bun test --grep "shared resource"

# Test atomic operation failures
bun test --grep "atomic operation"
```

## 🔧 EDGE CASE TEST IMPLEMENTATION

### Test Structure Template

```typescript
describe('Edge Case: [Category]', () => {
  beforeEach(() => {
    // Setup edge case environment
  });

  afterEach(() => {
    // Cleanup edge case artifacts
  });

  test('should handle [specific edge case]', async () => {
    // Arrange: Create edge case scenario
    const edgeInput = createEdgeCaseInput();

    // Act: Execute operation with edge case
    const result = await executeWithEdgeCase(edgeInput);

    // Assert: Verify graceful handling
    expect(result).toHandleEdgeCaseGracefully();
  });
});
```

### Edge Case Data Generators

```typescript
// Generate boundary values
export const generateBoundaryValues = () => ({
  minInt: Number.MIN_SAFE_INTEGER,
  maxInt: Number.MAX_SAFE_INTEGER,
  emptyString: '',
  maxString: 'x'.repeat(10000),
  nullValue: null,
  undefinedValue: undefined,
  emptyArray: [],
  emptyObject: {}
});

// Generate invalid inputs
export const generateInvalidInputs = () => ({
  stringAsNumber: 'not-a-number',
  objectAsString: { key: 'value' },
  arrayAsObject: ['item1', 'item2'],
  functionAsData: () => 'function'
});
```

## 🚨 CRITICAL EDGE CASES

### High Priority Edge Cases

**System Resource Exhaustion**
- Memory limit reached during large operations
- Disk space exhausted during file creation
- CPU timeout during complex calculations
- Network timeout during remote operations

**Data Corruption Scenarios**
- Partial file writes due to interruption
- Corrupted JSON configuration files
- Invalid YAML frontmatter in rules
- Broken task dependency chains

**Security Edge Cases**
- Path traversal attempts in file operations
- Code injection in task descriptions
- Privilege escalation attempts
- Unauthorized file access

### Medium Priority Edge Cases

**User Interface Edge Cases**
- Very long task names in displays
- Special characters in user inputs
- Unicode handling in file names
- Emoji in task descriptions

**Integration Edge Cases**
- Git repository corruption
- External tool failures
- API rate limiting
- Network connectivity issues

## 📊 EDGE CASE TESTING METRICS

### Coverage Metrics

**Boundary Coverage**
- All input boundaries tested: Target 100%
- All output boundaries verified: Target 100%
- All error boundaries handled: Target 95%

**Scenario Coverage**
- Exception scenarios tested: Target 90%
- Recovery scenarios verified: Target 85%
- Fallback mechanisms tested: Target 80%

### Quality Metrics

**Robustness Score**
- Graceful error handling: +25 points
- Meaningful error messages: +20 points
- System recovery capability: +25 points
- Data integrity preservation: +30 points

**Success Thresholds**
- **EXCELLENT**: 90-100 points - Robust edge case handling
- **GOOD**: 75-89 points - Adequate edge case coverage
- **ACCEPTABLE**: 60-74 points - Basic edge case handling
- **POOR**: <60 points - Insufficient edge case coverage

## 🔄 EDGE CASE TESTING WORKFLOW

```mermaid
graph TD
    Start["🚀 Start Edge Case Testing"] --> Identify["🔍 Identify Edge Cases"]
    Identify --> Categorize["📊 Categorize by Priority"]
    Categorize --> Design["📝 Design Test Cases"]
    Design --> Implement["⚙️ Implement Tests"]
    Implement --> Execute["▶️ Execute Tests"]
    Execute --> Analyze["📈 Analyze Results"]
    Analyze --> Fix["🔧 Fix Issues"]
    Fix --> Verify["✅ Verify Fixes"]
    Verify --> Document["📚 Document Findings"]

    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style Identify fill:#4dbb5f,stroke:#36873f,color:white
    style Execute fill:#ffa64d,stroke:#cc7a30,color:white
    style Fix fill:#ff5555,stroke:#cc0000,color:white
    style Document fill:#5fd94d,stroke:#3da336,color:white
```

## 🛡️ EDGE CASE PREVENTION

### Proactive Measures

**Input Validation**
- Validate all inputs at entry points
- Sanitize user-provided data
- Enforce data type constraints
- Implement size limitations

**Error Handling**
- Implement comprehensive try-catch blocks
- Provide meaningful error messages
- Log edge case occurrences
- Implement graceful degradation

**System Monitoring**
- Monitor resource usage
- Track error rates
- Alert on edge case patterns
- Analyze failure trends

This edge case testing framework ensures Memory Bank system robustness by systematically identifying, testing, and handling boundary conditions and exceptional scenarios.
