---
description: "Legacy system support and integration rules for Memory Bank evolution"
globs: "**/refactoring/**", "**/legacy-support/**", "**/integration/**"
alwaysApply: true
---

# LEGACY SUPPORT RULES

> **TL;DR:** Comprehensive legacy system support framework ensuring Memory Bank maintains compatibility with existing systems, data formats, and workflows during modernization.

## 🔧 LEGACY SUPPORT OVERVIEW

Legacy Support ensures Memory Bank evolution maintains compatibility with existing systems, enabling gradual modernization without disrupting established workflows or losing valuable data.

### Core Support Principles

**Seamless Integration**
- Maintain existing interfaces
- Support legacy data formats
- Preserve workflow compatibility
- Provide migration assistance

**Gradual Modernization**
- Incremental system updates
- Parallel system operation
- Safe migration paths
- Rollback capabilities

## 🛠️ LEGACY INTEGRATION PATTERNS

### 1. Adapter Pattern Implementation

**Legacy System Adapters**
```typescript
// Legacy task format from older Memory Bank versions
interface LegacyTask {
  taskId: string;
  taskName: string;
  taskStatus: 'new' | 'active' | 'done';
  taskPriority: 'low' | 'normal' | 'high';
  createdDate: string; // String format
}

// Modern task format
interface ModernTask {
  id: string;
  name: string;
  status: 'PLANNED' | 'IN_PROGRESS' | 'COMPLETED' | 'BLOCKED';
  priority: 'LOW' | 'MEDIUM' | 'HIGH' | 'CRITICAL';
  created: Date;
  updated: Date;
  metadata: TaskMetadata;
}

// Adapter to bridge legacy and modern formats
class LegacyTaskAdapter {
  toModernFormat(legacyTask: LegacyTask): ModernTask {
    return {
      id: legacyTask.taskId,
      name: legacyTask.taskName,
      status: this.mapLegacyStatus(legacyTask.taskStatus),
      priority: this.mapLegacyPriority(legacyTask.taskPriority),
      created: new Date(legacyTask.createdDate),
      updated: new Date(), // Set current time as updated
      metadata: {
        source: 'legacy',
        originalFormat: 'v1.0',
        migrated: true
      }
    };
  }

  toLegacyFormat(modernTask: ModernTask): LegacyTask {
    return {
      taskId: modernTask.id,
      taskName: modernTask.name,
      taskStatus: this.mapModernStatus(modernTask.status),
      taskPriority: this.mapModernPriority(modernTask.priority),
      createdDate: modernTask.created.toISOString()
    };
  }

  private mapLegacyStatus(legacyStatus: string): ModernTask['status'] {
    const statusMap: Record<string, ModernTask['status']> = {
      'new': 'PLANNED',
      'active': 'IN_PROGRESS',
      'done': 'COMPLETED'
    };
    return statusMap[legacyStatus] || 'PLANNED';
  }

  private mapModernStatus(modernStatus: ModernTask['status']): LegacyTask['taskStatus'] {
    const statusMap: Record<ModernTask['status'], LegacyTask['taskStatus']> = {
      'PLANNED': 'new',
      'IN_PROGRESS': 'active',
      'COMPLETED': 'done',
      'BLOCKED': 'active' // Map blocked to active for legacy compatibility
    };
    return statusMap[modernStatus] || 'new';
  }
}
```

### 2. Legacy File Format Support

**Multi-Format File Handler**
```typescript
interface FileFormatHandler {
  canHandle(filePath: string): boolean;
  read(filePath: string): Promise<any>;
  write(filePath: string, data: any): Promise<void>;
}

class LegacyMarkdownHandler implements FileFormatHandler {
  canHandle(filePath: string): boolean {
    return filePath.endsWith('.md') && this.isLegacyFormat(filePath);
  }

  async read(filePath: string): Promise<Task[]> {
    const content = await fs.readFile(filePath, 'utf-8');
    return this.parseLegacyMarkdown(content);
  }

  async write(filePath: string, tasks: Task[]): Promise<void> {
    const legacyContent = this.convertToLegacyMarkdown(tasks);
    await fs.writeFile(filePath, legacyContent);
  }

  private parseLegacyMarkdown(content: string): Task[] {
    // Parse old markdown format
    const lines = content.split('\n');
    const tasks: Task[] = [];

    for (const line of lines) {
      if (line.startsWith('- [ ]') || line.startsWith('- [x]')) {
        const task = this.parseTaskLine(line);
        if (task) tasks.push(task);
      }
    }

    return tasks;
  }

  private parseTaskLine(line: string): Task | null {
    // Parse legacy task format: "- [x] Task name (priority: high)"
    const match = line.match(/^- \[([ x])\] (.+?)(?:\s*\(priority:\s*(\w+)\))?$/);
    if (!match) return null;

    const [, completed, name, priority] = match;

    return {
      id: this.generateId(name),
      name: name.trim(),
      status: completed === 'x' ? 'COMPLETED' : 'PLANNED',
      priority: this.mapLegacyPriority(priority || 'normal'),
      created: new Date(),
      updated: new Date()
    };
  }
}

class ModernYamlHandler implements FileFormatHandler {
  canHandle(filePath: string): boolean {
    return filePath.endsWith('.yaml') || filePath.endsWith('.yml');
  }

  async read(filePath: string): Promise<Task[]> {
    const content = await fs.readFile(filePath, 'utf-8');
    const data = yaml.parse(content);
    return data.tasks || [];
  }

  async write(filePath: string, tasks: Task[]): Promise<void> {
    const data = { tasks, version: '2.0', updated: new Date() };
    const yamlContent = yaml.stringify(data);
    await fs.writeFile(filePath, yamlContent);
  }
}

// File format manager that handles multiple formats
class MultiFormatFileManager {
  private handlers: FileFormatHandler[] = [
    new LegacyMarkdownHandler(),
    new ModernYamlHandler(),
    new JsonHandler(),
    new CsvHandler()
  ];

  async readTasks(filePath: string): Promise<Task[]> {
    const handler = this.findHandler(filePath);
    if (!handler) {
      throw new Error(`Unsupported file format: ${filePath}`);
    }

    return await handler.read(filePath);
  }

  async writeTasks(filePath: string, tasks: Task[]): Promise<void> {
    const handler = this.findHandler(filePath);
    if (!handler) {
      throw new Error(`Unsupported file format: ${filePath}`);
    }

    await handler.write(filePath, tasks);
  }

  private findHandler(filePath: string): FileFormatHandler | null {
    return this.handlers.find(handler => handler.canHandle(filePath)) || null;
  }
}
```

### 3. Legacy API Compatibility

**API Version Management**
```typescript
interface ApiVersionHandler {
  version: string;
  handle(request: any): Promise<any>;
}

class LegacyApiV1Handler implements ApiVersionHandler {
  version = 'v1';

  async handle(request: LegacyApiRequest): Promise<LegacyApiResponse> {
    // Handle legacy API format
    const modernRequest = this.convertToModernRequest(request);
    const modernResponse = await this.modernApiHandler.handle(modernRequest);
    return this.convertToLegacyResponse(modernResponse);
  }

  private convertToModernRequest(legacyRequest: LegacyApiRequest): ModernApiRequest {
    return {
      action: legacyRequest.command,
      data: this.adaptLegacyData(legacyRequest.params),
      version: '2.0',
      timestamp: new Date()
    };
  }

  private convertToLegacyResponse(modernResponse: ModernApiResponse): LegacyApiResponse {
    return {
      status: modernResponse.success ? 'ok' : 'error',
      result: this.adaptModernData(modernResponse.data),
      message: modernResponse.message
    };
  }
}

class ModernApiV2Handler implements ApiVersionHandler {
  version = 'v2';

  async handle(request: ModernApiRequest): Promise<ModernApiResponse> {
    // Handle modern API format directly
    return await this.processModernRequest(request);
  }
}

// API router that handles multiple versions
class VersionedApiRouter {
  private handlers: Map<string, ApiVersionHandler> = new Map();

  registerHandler(handler: ApiVersionHandler): void {
    this.handlers.set(handler.version, handler);
  }

  async route(request: any): Promise<any> {
    const version = this.detectVersion(request);
    const handler = this.handlers.get(version);

    if (!handler) {
      throw new Error(`Unsupported API version: ${version}`);
    }

    return await handler.handle(request);
  }

  private detectVersion(request: any): string {
    // Detect version from request headers, URL, or content
    return request.version || request.headers?.['api-version'] || 'v1';
  }
}
```

### 4. Legacy Configuration Support

**Configuration Migration**
```typescript
interface ConfigurationMigrator {
  fromVersion: string;
  toVersion: string;
  migrate(config: any): any;
}

class ConfigV1ToV2Migrator implements ConfigurationMigrator {
  fromVersion = '1.0';
  toVersion = '2.0';

  migrate(v1Config: any): any {
    const v2Config = {
      version: '2.0',
      migrated: true,
      migratedFrom: '1.0',
      migratedAt: new Date().toISOString()
    };

    // Migrate settings
    if (v1Config.settings) {
      v2Config.preferences = {
        theme: v1Config.settings.theme || 'default',
        notifications: v1Config.settings.enableNotifications !== false,
        autoSave: v1Config.settings.autoSave !== false
      };
    }

    // Migrate workflows
    if (v1Config.workflows) {
      v2Config.modes = this.migrateWorkflows(v1Config.workflows);
    }

    // Migrate file paths
    if (v1Config.paths) {
      v2Config.storage = {
        tasksDirectory: v1Config.paths.taskDir || 'tasks',
        archiveDirectory: v1Config.paths.archiveDir || 'archive',
        templatesDirectory: v1Config.paths.templateDir || 'templates'
      };
    }

    return v2Config;
  }

  private migrateWorkflows(legacyWorkflows: any): any {
    // Convert legacy workflow names to modern mode names
    const modeMapping = {
      'analyze': 'VAN',
      'design': 'CREATIVE',
      'build': 'IMPLEMENT',
      'review': 'REFLECT'
    };

    const modernModes = {};

    for (const [legacyName, config] of Object.entries(legacyWorkflows)) {
      const modernName = modeMapping[legacyName] || legacyName.toUpperCase();
      modernModes[modernName] = {
        enabled: config.enabled !== false,
        settings: config.settings || {},
        migrated: true
      };
    }

    return modernModes;
  }
}

class ConfigurationManager {
  private migrators: ConfigurationMigrator[] = [
    new ConfigV1ToV2Migrator(),
    new ConfigV2ToV3Migrator()
  ];

  async loadConfiguration(configPath: string): Promise<any> {
    const rawConfig = await this.readConfigFile(configPath);
    const currentVersion = this.detectVersion(rawConfig);

    if (this.isCurrentVersion(currentVersion)) {
      return rawConfig;
    }

    // Migrate configuration to current version
    return await this.migrateConfiguration(rawConfig, currentVersion);
  }

  private async migrateConfiguration(config: any, fromVersion: string): Promise<any> {
    let currentConfig = config;
    let currentVersion = fromVersion;

    // Apply migrations sequentially
    for (const migrator of this.migrators) {
      if (migrator.fromVersion === currentVersion) {
        console.log(`Migrating configuration from ${migrator.fromVersion} to ${migrator.toVersion}`);
        currentConfig = migrator.migrate(currentConfig);
        currentVersion = migrator.toVersion;
      }
    }

    // Save migrated configuration
    await this.saveConfiguration(currentConfig);

    return currentConfig;
  }
}
```

## 🔄 LEGACY DATA MIGRATION

### Safe Migration Process

**Data Migration Framework**
```typescript
class LegacyDataMigrator {
  async migrateData(sourcePath: string, targetPath: string): Promise<MigrationResult> {
    try {
      // 1. Backup original data
      const backupPath = await this.createBackup(sourcePath);

      // 2. Analyze source data
      const sourceAnalysis = await this.analyzeSourceData(sourcePath);

      // 3. Plan migration
      const migrationPlan = this.createMigrationPlan(sourceAnalysis);

      // 4. Execute migration
      const migrationResult = await this.executeMigration(migrationPlan);

      // 5. Validate migrated data
      const validation = await this.validateMigration(sourcePath, targetPath);

      if (validation.success) {
        return {
          success: true,
          migratedItems: migrationResult.itemCount,
          backupPath,
          validationReport: validation
        };
      } else {
        // Rollback on validation failure
        await this.rollbackMigration(backupPath, sourcePath);
        throw new Error('Migration validation failed');
      }

    } catch (error) {
      return {
        success: false,
        error: error.message,
        rollbackCompleted: true
      };
    }
  }

  private async validateMigration(sourcePath: string, targetPath: string): Promise<ValidationResult> {
    const sourceData = await this.loadLegacyData(sourcePath);
    const targetData = await this.loadModernData(targetPath);

    return {
      success: sourceData.length === targetData.length,
      sourceCount: sourceData.length,
      targetCount: targetData.length,
      dataIntegrityCheck: this.verifyDataIntegrity(sourceData, targetData)
    };
  }
}
```

## 📊 LEGACY SUPPORT METRICS

### Support Quality Indicators

**Legacy Support Metrics**
- Legacy system compatibility: Target 100%
- Data migration success rate: Target >99%
- API backward compatibility: Target 100%
- Configuration migration success: Target >95%

**Quality Indicators**
- **EXCELLENT Support (95-100%)**
  - Full legacy compatibility
  - Seamless migrations
  - Zero data loss
  - Complete API compatibility

- **GOOD Support (85-94%)**
  - Most legacy features supported
  - Successful migrations with minor issues
  - Minimal data loss
  - Good API compatibility

- **NEEDS IMPROVEMENT (<85%)**
  - Limited legacy support
  - Migration failures
  - Data loss incidents
  - API compatibility issues

This legacy support framework ensures smooth Memory Bank evolution while maintaining full compatibility with existing systems and data.