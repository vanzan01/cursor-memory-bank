---
description: "Integration testing methodology for Memory Bank development"
globs: "**/integration/**", "**/testing/**", "**/qa/**"
alwaysApply: false
---

# INTEGRATION TESTING METHODOLOGY

> **TL;DR:** Comprehensive integration testing framework for Memory Bank development, ensuring seamless component interaction and system reliability.

## 🔗 INTEGRATION TESTING OVERVIEW

Integration testing validates the interaction between Memory Bank components, modes, and external systems to ensure cohesive functionality.

### Testing Scope

**Component Integration**
- Mode transition testing
- File system integration
- Configuration system integration
- User interface integration

**System Integration**
- Git workflow integration
- IDE integration (Cursor)
- Command execution integration
- External tool integration

**Data Integration**
- Task data flow testing
- Migration system testing
- Archive system testing
- Configuration data testing

## 🧪 TESTING STRATEGIES

### 1. Mode Transition Testing

**VAN → PLAN Integration**
```typescript
describe('VAN to PLAN Mode Transition', () => {
  test('should preserve task context during transition', async () => {
    // Setup VAN mode with tasks
    const vanMode = new VANMode();
    await vanMode.initialize();
    await vanMode.addTask({
      id: 'TEST-TASK-001',
      priority: 'HIGH',
      status: 'PLANNED'
    });

    // Transition to PLAN mode
    const planMode = await vanMode.transitionTo('PLAN');

    // Verify task preservation
    expect(planMode.getTasks()).toContain('TEST-TASK-001');
    expect(planMode.getTaskStatus('TEST-TASK-001')).toBe('PLANNED');
  });

  test('should create migration document for incomplete work', async () => {
    // Setup incomplete work scenario
    const vanMode = new VANMode();
    await vanMode.addTask({
      id: 'INCOMPLETE-TASK',
      status: 'IN_PROGRESS',
      completion: 75
    });

    // Attempt transition
    const result = await vanMode.transitionTo('PLAN');

    // Verify migration creation
    expect(fs.existsSync('memory-bank/migration.md')).toBe(true);
    const migration = await fs.readFile('memory-bank/migration.md', 'utf-8');
    expect(migration).toContain('INCOMPLETE-TASK');
  });
});
```

**PLAN → CREATIVE Integration**
```typescript
describe('PLAN to CREATIVE Mode Transition', () => {
  test('should pass planning context to creative phase', async () => {
    // Setup PLAN mode with implementation plan
    const planMode = new PLANMode();
    await planMode.createImplementationPlan({
      approach: 'phased',
      phases: ['core', 'features', 'polish'],
      timeline: '2 weeks'
    });

    // Transition to CREATIVE mode
    const creativeMode = await planMode.transitionTo('CREATIVE');

    // Verify context transfer
    expect(creativeMode.getPlanningContext()).toBeDefined();
    expect(creativeMode.getPhases()).toEqual(['core', 'features', 'polish']);
  });
});
```

### 2. File System Integration Testing

**Configuration System**
```typescript
describe('Configuration System Integration', () => {
  test('should load and validate system configuration', async () => {
    // Test configuration loading
    const config = await ConfigManager.load();

    expect(config.interaction.mode).toMatch(/^(AUTO|MANUAL)$/);
    expect(config.date_management.source).toBe('system');
    expect(config.modes).toBeDefined();
  });

  test('should handle configuration updates', async () => {
    // Update interaction mode
    await ConfigManager.updateInteractionMode('AUTO');

    // Verify persistence
    const config = await ConfigManager.load();
    expect(config.interaction.mode).toBe('AUTO');

    // Verify file system update
    const modeFile = await fs.readFile('memory-bank/system/interaction-mode.txt', 'utf-8');
    expect(modeFile.trim()).toBe('AUTO');
  });
});
```

**Task Management System**
```typescript
describe('Task Management Integration', () => {
  test('should maintain task consistency across operations', async () => {
    // Create task
    const taskManager = new TaskManager();
    await taskManager.addTask({
      id: 'INTEGRATION-TEST',
      name: 'Test task integration',
      priority: 'MEDIUM'
    });

    // Update task
    await taskManager.updateTaskStatus('INTEGRATION-TEST', 'IN_PROGRESS');

    // Verify persistence
    const tasks = await taskManager.loadTasks();
    const task = tasks.find(t => t.id === 'INTEGRATION-TEST');
    expect(task.status).toBe('IN_PROGRESS');
  });
});
```

### 3. Migration System Integration

**Migration Creation and Processing**
```typescript
describe('Migration System Integration', () => {
  test('should create and process migration documents', async () => {
    // Setup scenario with incomplete work
    const taskManager = new TaskManager();
    await taskManager.addTask({
      id: 'MIGRATION-TEST',
      status: 'IN_PROGRESS',
      completion: 60
    });

    // Create migration
    const migrationManager = new MigrationManager();
    await migrationManager.createMigration('IMPLEMENT', 'REFLECT');

    // Verify migration document
    expect(fs.existsSync('memory-bank/migration.md')).toBe(true);

    // Process migration
    await migrationManager.processMigration();

    // Verify task preservation
    const tasks = await taskManager.loadTasks();
    expect(tasks.some(t => t.id === 'MIGRATION-TEST')).toBe(true);
  });
});
```

### 4. Command Execution Integration

**Git Integration**
```typescript
describe('Git Integration', () => {
  test('should execute git commands safely', async () => {
    const gitManager = new GitManager();

    // Test status check
    const status = await gitManager.getStatus();
    expect(status).toBeDefined();

    // Test commit creation
    await gitManager.commit('Test integration commit');

    // Verify commit exists
    const log = await gitManager.getLog(1);
    expect(log[0].message).toBe('Test integration commit');
  });
});
```

**File Operations**
```typescript
describe('File Operations Integration', () => {
  test('should handle file operations safely', async () => {
    const fileManager = new FileManager();

    // Test file creation
    await fileManager.createFile('test-integration.md', 'Test content');
    expect(fs.existsSync('test-integration.md')).toBe(true);

    // Test file reading
    const content = await fileManager.readFile('test-integration.md');
    expect(content).toBe('Test content');

    // Test file deletion
    await fileManager.deleteFile('test-integration.md');
    expect(fs.existsSync('test-integration.md')).toBe(false);
  });
});
```

## 🔄 CONTINUOUS INTEGRATION TESTING

### Automated Test Suites

**Daily Integration Tests**
```bash
#!/bin/bash
# daily-integration-tests.sh

echo "Running daily integration tests..."

# Mode transition tests
bun test tests/integration/mode-transitions.test.ts

# File system integration tests
bun test tests/integration/file-system.test.ts

# Configuration system tests
bun test tests/integration/config-system.test.ts

# Migration system tests
bun test tests/integration/migration-system.test.ts

# Generate report
bun test --reporter=html --output-dir=reports/integration
```

**Weekly System Tests**
```bash
#!/bin/bash
# weekly-system-tests.sh

echo "Running weekly system integration tests..."

# Full workflow tests
bun test tests/integration/full-workflow.test.ts

# Performance integration tests
bun test tests/integration/performance.test.ts

# Security integration tests
bun test tests/integration/security.test.ts

# Backup and recovery tests
bun test tests/integration/backup-recovery.test.ts
```

### Test Environment Setup

**Test Configuration**
```yaml
# test-config.yaml
test_environment:
  memory_bank_path: "test-memory-bank"
  git_repo: "test-repo"
  isolation: true
  cleanup: true

integration_tests:
  mode_transitions: true
  file_operations: true
  configuration: true
  migration: true
  git_integration: true

performance_tests:
  load_testing: true
  stress_testing: true
  memory_usage: true
  response_time: true
```

**Test Data Management**
```typescript
class TestDataManager {
  async setupTestEnvironment(): Promise<void> {
    // Create isolated test environment
    await this.createTestDirectory();
    await this.initializeTestGitRepo();
    await this.setupTestConfiguration();
    await this.createTestTasks();
  }

  async cleanupTestEnvironment(): Promise<void> {
    // Clean up test artifacts
    await this.removeTestDirectory();
    await this.resetTestConfiguration();
  }

  async createTestScenario(scenario: string): Promise<void> {
    switch (scenario) {
      case 'incomplete_work':
        await this.createIncompleteWorkScenario();
        break;
      case 'mode_transition':
        await this.createModeTransitionScenario();
        break;
      case 'migration_needed':
        await this.createMigrationScenario();
        break;
    }
  }
}
```

## 📊 INTEGRATION TEST METRICS

### Success Criteria

**Functional Integration**
- All mode transitions work correctly: 100%
- File operations complete successfully: >99%
- Configuration changes persist: 100%
- Migration system preserves data: 100%

**Performance Integration**
- Mode transition time: <30 seconds
- File operation response: <5 seconds
- Configuration load time: <2 seconds
- Migration processing: <60 seconds

**Reliability Integration**
- System uptime during tests: >99%
- Error recovery success: >95%
- Data consistency maintained: 100%
- Backup system functionality: 100%

### Test Coverage

**Component Coverage**
- Mode transition logic: 100%
- File system operations: 95%
- Configuration management: 100%
- Migration system: 100%

**Scenario Coverage**
- Happy path scenarios: 100%
- Error scenarios: 90%
- Edge cases: 85%
- Performance scenarios: 80%

## 🚨 ERROR HANDLING INTEGRATION

### Error Scenario Testing

**System Failure Recovery**
```typescript
describe('System Failure Recovery', () => {
  test('should recover from file system errors', async () => {
    // Simulate file system error
    jest.spyOn(fs, 'writeFile').mockRejectedValue(new Error('Disk full'));

    const taskManager = new TaskManager();

    // Attempt operation
    const result = await taskManager.addTask({
      id: 'ERROR-TEST',
      name: 'Test error handling'
    });

    // Verify graceful handling
    expect(result.success).toBe(false);
    expect(result.error).toContain('Disk full');

    // Verify system stability
    expect(taskManager.isHealthy()).toBe(true);
  });
});
```

**Network Failure Handling**
```typescript
describe('Network Failure Handling', () => {
  test('should handle git remote failures gracefully', async () => {
    // Simulate network failure
    jest.spyOn(GitManager.prototype, 'push').mockRejectedValue(
      new Error('Network unreachable')
    );

    const gitManager = new GitManager();
    const result = await gitManager.syncChanges();

    // Verify local operations continue
    expect(result.localCommit).toBe(true);
    expect(result.remoteSync).toBe(false);
    expect(result.error).toContain('Network unreachable');
  });
});
```

This comprehensive integration testing methodology ensures robust and reliable Memory Bank operations across all system components and interactions.
