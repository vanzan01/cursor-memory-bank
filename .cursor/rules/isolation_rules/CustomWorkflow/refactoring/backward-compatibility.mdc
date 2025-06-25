---
description: "Backward compatibility guidelines for Memory Bank refactoring"
globs: "**/refactoring/**", "**/compatibility/**", "**/migration/**"
alwaysApply: false
---

# BACKWARD COMPATIBILITY GUIDELINES

> **TL;DR:** Comprehensive backward compatibility strategy for Memory Bank refactoring, ensuring seamless upgrades and migration paths while maintaining system stability and user experience.

## 🔄 COMPATIBILITY OVERVIEW

Backward compatibility ensures that Memory Bank upgrades and refactoring don't break existing workflows, configurations, or user data, providing smooth evolution paths.

### Compatibility Principles

**Non-Breaking Changes**
- Additive modifications only
- Preserve existing interfaces
- Maintain data format compatibility
- Support legacy configurations

**Graceful Deprecation**
- Clear deprecation warnings
- Migration assistance tools
- Extended support periods
- Documentation updates

**Version Management**
- Semantic versioning
- Clear upgrade paths
- Rollback capabilities
- Compatibility matrices

## 📋 COMPATIBILITY STRATEGIES

### 1. Interface Compatibility

**API Versioning Strategy**
```typescript
// Maintain multiple API versions simultaneously
interface MemoryBankAPI_v1 {
  createTask(name: string, priority: string): Promise<string>;
  updateTask(id: string, updates: any): Promise<void>;
  getTasks(): Promise<any[]>;
}

interface MemoryBankAPI_v2 {
  createTask(task: TaskCreationRequest): Promise<TaskResponse>;
  updateTask(id: string, updates: TaskUpdateRequest): Promise<TaskResponse>;
  getTasks(filter?: TaskFilter): Promise<TaskResponse[]>;
  // New methods
  getTaskHistory(id: string): Promise<TaskHistoryResponse>;
  bulkUpdateTasks(updates: BulkUpdateRequest): Promise<BulkUpdateResponse>;
}

// Adapter pattern for backward compatibility
class MemoryBankAPI_v1_Adapter implements MemoryBankAPI_v1 {
  constructor(private v2Api: MemoryBankAPI_v2) {}

  async createTask(name: string, priority: string): Promise<string> {
    const request: TaskCreationRequest = {
      name,
      priority: priority as TaskPriority,
      description: '',
      metadata: {}
    };

    const response = await this.v2Api.createTask(request);
    return response.id;
  }

  async updateTask(id: string, updates: any): Promise<void> {
    // Convert v1 format to v2 format
    const v2Updates: TaskUpdateRequest = {
      name: updates.name,
      priority: updates.priority,
      status: updates.status,
      metadata: updates.metadata || {}
    };

    await this.v2Api.updateTask(id, v2Updates);
  }

  async getTasks(): Promise<any[]> {
    const v2Tasks = await this.v2Api.getTasks();

    // Convert v2 format back to v1 format
    return v2Tasks.map(task => ({
      id: task.id,
      name: task.name,
      priority: task.priority,
      status: task.status,
      created: task.metadata.created
    }));
  }
}
```

**Configuration Compatibility**
```typescript
// Support multiple configuration formats
interface LegacyConfig {
  taskDir: string;
  archiveDir: string;
  enableNotifications: boolean;
  theme: string;
}

interface ModernConfig {
  storage: {
    tasksDirectory: string;
    archiveDirectory: string;
    templatesDirectory: string;
  };
  preferences: {
    notifications: boolean;
    theme: string;
    autoSave: boolean;
  };
  modes: {
    [key: string]: ModeConfiguration;
  };
}

class ConfigurationMigrator {
  migrateFromLegacy(legacy: LegacyConfig): ModernConfig {
    return {
      storage: {
        tasksDirectory: legacy.taskDir || 'tasks',
        archiveDirectory: legacy.archiveDir || 'archive',
        templatesDirectory: 'templates'
      },
      preferences: {
        notifications: legacy.enableNotifications !== false,
        theme: legacy.theme || 'default',
        autoSave: true
      },
      modes: {
        VAN: { enabled: true },
        PLAN: { enabled: true },
        CREATIVE: { enabled: true },
        IMPLEMENT: { enabled: true },
        REFLECT: { enabled: true },
        ARCHIVE: { enabled: true }
      }
    };
  }

  async loadConfiguration(configPath: string): Promise<ModernConfig> {
    const rawConfig = await this.readConfigFile(configPath);

    // Detect configuration version
    if (this.isLegacyFormat(rawConfig)) {
      console.warn('Legacy configuration detected. Consider upgrading.');
      return this.migrateFromLegacy(rawConfig as LegacyConfig);
    }

    return rawConfig as ModernConfig;
  }
}
```

### 2. Data Format Compatibility

**Task Format Evolution**
```typescript
// Support multiple task formats
interface TaskFormat_v1 {
  id: string;
  name: string;
  status: 'new' | 'active' | 'done';
  priority: 'low' | 'normal' | 'high';
  created: string;
}

interface TaskFormat_v2 {
  id: string;
  name: string;
  description: string;
  status: 'PLANNED' | 'IN_PROGRESS' | 'COMPLETED' | 'BLOCKED';
  priority: 'LOW' | 'MEDIUM' | 'HIGH' | 'CRITICAL';
  created: Date;
  updated: Date;
  metadata: TaskMetadata;
}

class TaskFormatMigrator {
  migrateTask(task: any): TaskFormat_v2 {
    // Detect task format version
    if (this.isV1Format(task)) {
      return this.migrateFromV1(task as TaskFormat_v1);
    }

    return task as TaskFormat_v2;
  }

  private migrateFromV1(v1Task: TaskFormat_v1): TaskFormat_v2 {
    return {
      id: v1Task.id,
      name: v1Task.name,
      description: '',
      status: this.mapV1Status(v1Task.status),
      priority: this.mapV1Priority(v1Task.priority),
      created: new Date(v1Task.created),
      updated: new Date(),
      metadata: {
        version: '2.0',
        migratedFrom: '1.0',
        originalStatus: v1Task.status,
        originalPriority: v1Task.priority
      }
    };
  }

  private mapV1Status(v1Status: string): TaskFormat_v2['status'] {
    const statusMap = {
      'new': 'PLANNED',
      'active': 'IN_PROGRESS',
      'done': 'COMPLETED'
    };
    return statusMap[v1Status] || 'PLANNED';
  }
}
```

**File Format Compatibility**
```typescript
// Support multiple file formats
class FileFormatHandler {
  async readTasksFile(filePath: string): Promise<TaskFormat_v2[]> {
    const content = await fs.readFile(filePath, 'utf-8');

    // Detect file format
    if (filePath.endsWith('.json')) {
      return this.parseJSONFormat(content);
    } else if (filePath.endsWith('.yaml') || filePath.endsWith('.yml')) {
      return this.parseYAMLFormat(content);
    } else if (filePath.endsWith('.md')) {
      return this.parseMarkdownFormat(content);
    }

    throw new Error(`Unsupported file format: ${filePath}`);
  }

  private parseMarkdownFormat(content: string): TaskFormat_v2[] {
    // Parse legacy markdown format
    const tasks: TaskFormat_v2[] = [];
    const lines = content.split('\n');

    for (const line of lines) {
      if (line.startsWith('- [ ]') || line.startsWith('- [x]')) {
        const task = this.parseMarkdownTask(line);
        if (task) {
          tasks.push(task);
        }
      }
    }

    return tasks;
  }

  private parseMarkdownTask(line: string): TaskFormat_v2 | null {
    // Parse: "- [x] Task name (priority: high)"
    const match = line.match(/^- \[([ x])\] (.+?)(?:\s*\(priority:\s*(\w+)\))?$/);
    if (!match) return null;

    const [, completed, name, priority] = match;

    return {
      id: this.generateTaskId(name),
      name: name.trim(),
      description: '',
      status: completed === 'x' ? 'COMPLETED' : 'PLANNED',
      priority: this.mapLegacyPriority(priority || 'normal'),
      created: new Date(),
      updated: new Date(),
      metadata: {
        version: '2.0',
        migratedFrom: 'markdown',
        source: 'legacy'
      }
    };
  }
}
```

### 3. Command Compatibility

**CLI Command Evolution**
```typescript
// Maintain backward compatibility for CLI commands
class CompatibleCommandHandler {
  async handleCommand(command: string, args: string[]): Promise<void> {
    // Support legacy command formats
    if (this.isLegacyCommand(command)) {
      await this.handleLegacyCommand(command, args);
      return;
    }

    // Handle modern commands
    await this.handleModernCommand(command, args);
  }

  private async handleLegacyCommand(command: string, args: string[]): Promise<void> {
    console.warn(`Legacy command '${command}' is deprecated. Use modern equivalent.`);

    switch (command) {
      case 'analyze':
        // Map to modern VAN mode
        await this.executeMode('VAN', args);
        break;
      case 'design':
        // Map to modern CREATIVE mode
        await this.executeMode('CREATIVE', args);
        break;
      case 'build':
        // Map to modern IMPLEMENT mode
        await this.executeMode('IMPLEMENT', args);
        break;
      case 'review':
        // Map to modern REFLECT mode
        await this.executeMode('REFLECT', args);
        break;
      default:
        throw new Error(`Unknown legacy command: ${command}`);
    }
  }
}
```

## 🔄 MIGRATION STRATEGIES

### Gradual Migration Approach

**Phase-Based Migration**
```typescript
interface MigrationPhase {
  name: string;
  description: string;
  prerequisites: string[];
  actions: MigrationAction[];
  rollbackActions: MigrationAction[];
  validations: ValidationCheck[];
}

class GradualMigrationManager {
  private phases: MigrationPhase[] = [
    {
      name: 'Phase 1: Configuration Migration',
      description: 'Migrate configuration files to new format',
      prerequisites: ['backup_created'],
      actions: [
        { type: 'migrate_config', source: 'config.json', target: 'config.yaml' },
        { type: 'validate_config', target: 'config.yaml' }
      ],
      rollbackActions: [
        { type: 'restore_config', source: 'config.json.backup' }
      ],
      validations: [
        { type: 'config_valid', target: 'config.yaml' },
        { type: 'system_functional' }
      ]
    },
    {
      name: 'Phase 2: Task Format Migration',
      description: 'Migrate task files to new format',
      prerequisites: ['phase_1_complete'],
      actions: [
        { type: 'migrate_tasks', source: 'tasks.md', target: 'tasks.yaml' },
        { type: 'validate_tasks', target: 'tasks.yaml' }
      ],
      rollbackActions: [
        { type: 'restore_tasks', source: 'tasks.md.backup' }
      ],
      validations: [
        { type: 'tasks_valid', target: 'tasks.yaml' },
        { type: 'data_integrity' }
      ]
    }
  ];

  async executeMigration(): Promise<MigrationResult> {
    const results: PhaseResult[] = [];

    for (const phase of this.phases) {
      try {
        console.log(`Executing ${phase.name}...`);

        // Check prerequisites
        await this.checkPrerequisites(phase.prerequisites);

        // Execute actions
        await this.executeActions(phase.actions);

        // Validate results
        await this.validatePhase(phase.validations);

        results.push({
          phase: phase.name,
          status: 'success',
          timestamp: new Date()
        });

      } catch (error) {
        console.error(`Phase ${phase.name} failed:`, error);

        // Execute rollback
        await this.executeActions(phase.rollbackActions);

        results.push({
          phase: phase.name,
          status: 'failed',
          error: error.message,
          timestamp: new Date()
        });

        break; // Stop migration on failure
      }
    }

    return {
      phases: results,
      overallStatus: results.every(r => r.status === 'success') ? 'success' : 'failed'
    };
  }
}
```

### Deprecation Management

**Deprecation Warning System**
```typescript
class DeprecationManager {
  private deprecations: Map<string, DeprecationInfo> = new Map();

  registerDeprecation(feature: string, info: DeprecationInfo): void {
    this.deprecations.set(feature, info);
  }

  checkDeprecation(feature: string): void {
    const deprecation = this.deprecations.get(feature);
    if (!deprecation) return;

    const now = new Date();
    const warningPeriod = new Date(deprecation.deprecatedSince);
    warningPeriod.setMonth(warningPeriod.getMonth() + 6); // 6 months warning

    if (now > warningPeriod && now < deprecation.removalDate) {
      console.warn(
        `⚠️ DEPRECATION WARNING: ${feature} is deprecated and will be removed on ${deprecation.removalDate.toDateString()}. ` +
        `Please use ${deprecation.replacement} instead. ` +
        `Migration guide: ${deprecation.migrationGuide}`
      );
    } else if (now >= deprecation.removalDate) {
      throw new Error(
        `❌ FEATURE REMOVED: ${feature} has been removed. ` +
        `Please use ${deprecation.replacement}. ` +
        `Migration guide: ${deprecation.migrationGuide}`
      );
    }
  }
}

interface DeprecationInfo {
  deprecatedSince: Date;
  removalDate: Date;
  replacement: string;
  migrationGuide: string;
  reason: string;
}
```

## 📊 COMPATIBILITY TESTING

### Automated Compatibility Tests

**Version Compatibility Matrix**
```typescript
describe('Backward Compatibility Tests', () => {
  const testVersions = ['1.0.0', '1.1.0', '1.2.0', '2.0.0'];

  testVersions.forEach(version => {
    describe(`Compatibility with version ${version}`, () => {
      test('should load legacy configuration', async () => {
        const legacyConfig = await loadTestConfig(version);
        const migrator = new ConfigurationMigrator();

        const modernConfig = await migrator.migrateFromLegacy(legacyConfig);

        expect(modernConfig).toBeDefined();
        expect(modernConfig.storage).toBeDefined();
        expect(modernConfig.preferences).toBeDefined();
      });

      test('should migrate legacy tasks', async () => {
        const legacyTasks = await loadTestTasks(version);
        const migrator = new TaskFormatMigrator();

        const modernTasks = legacyTasks.map(task => migrator.migrateTask(task));

        expect(modernTasks).toHaveLength(legacyTasks.length);
        modernTasks.forEach(task => {
          expect(task.id).toBeDefined();
          expect(task.name).toBeDefined();
          expect(task.status).toMatch(/^(PLANNED|IN_PROGRESS|COMPLETED|BLOCKED)$/);
        });
      });

      test('should handle legacy commands', async () => {
        const commandHandler = new CompatibleCommandHandler();

        // Test legacy command mapping
        await expect(commandHandler.handleCommand('analyze', [])).resolves.not.toThrow();
        await expect(commandHandler.handleCommand('design', [])).resolves.not.toThrow();
        await expect(commandHandler.handleCommand('build', [])).resolves.not.toThrow();
      });
    });
  });
});
```

**Data Integrity Tests**
```typescript
describe('Data Migration Integrity', () => {
  test('should preserve all task data during migration', async () => {
    const originalTasks = await loadLegacyTasks();
    const migrator = new TaskFormatMigrator();

    const migratedTasks = originalTasks.map(task => migrator.migrateTask(task));

    // Verify no data loss
    expect(migratedTasks).toHaveLength(originalTasks.length);

    // Verify essential data preserved
    for (let i = 0; i < originalTasks.length; i++) {
      const original = originalTasks[i];
      const migrated = migratedTasks[i];

      expect(migrated.id).toBe(original.id);
      expect(migrated.name).toBe(original.name);
      expect(migrated.metadata.originalStatus).toBe(original.status);
    }
  });

  test('should maintain referential integrity', async () => {
    const originalData = await loadCompleteDataSet();
    const migrationManager = new GradualMigrationManager();

    const result = await migrationManager.executeMigration();

    expect(result.overallStatus).toBe('success');

    // Verify relationships preserved
    const migratedData = await loadCompleteDataSet();
    await verifyReferentialIntegrity(originalData, migratedData);
  });
});
```

## 🎯 COMPATIBILITY BEST PRACTICES

### Design Guidelines

**API Design**
1. **Additive Changes Only**: Never remove or change existing API methods
2. **Optional Parameters**: New parameters should be optional with defaults
3. **Versioned Endpoints**: Provide versioned API endpoints for major changes
4. **Clear Deprecation**: Provide clear deprecation notices and timelines

**Data Format Design**
1. **Schema Evolution**: Design schemas to support evolution
2. **Version Fields**: Include version information in data structures
3. **Default Values**: Provide sensible defaults for new fields
4. **Migration Scripts**: Provide automated migration tools

**Configuration Design**
1. **Backward Compatible**: New configurations should not break old setups
2. **Migration Assistance**: Provide tools to migrate configurations
3. **Validation**: Validate configurations and provide helpful error messages
4. **Documentation**: Document all configuration changes clearly

### Migration Planning

**Pre-Migration Checklist**
- [ ] Create comprehensive backups
- [ ] Document current system state
- [ ] Identify all dependencies
- [ ] Plan rollback procedures
- [ ] Test migration in isolated environment
- [ ] Prepare user communication

**Post-Migration Validation**
- [ ] Verify all data migrated correctly
- [ ] Test all functionality works
- [ ] Validate performance hasn't degraded
- [ ] Confirm user workflows still function
- [ ] Monitor for issues in production
- [ ] Gather user feedback

This backward compatibility framework ensures smooth Memory Bank evolution while maintaining user trust and system stability.
