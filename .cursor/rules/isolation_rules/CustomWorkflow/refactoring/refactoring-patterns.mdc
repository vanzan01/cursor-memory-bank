---
description: "Refactoring patterns and techniques for Memory Bank development"
globs: "**/refactoring/**", "**/patterns/**", "**/techniques/**"
alwaysApply: false
---

# REFACTORING PATTERNS AND TECHNIQUES

> **TL;DR:** Comprehensive collection of proven refactoring patterns and techniques for Memory Bank development, providing systematic approaches to code improvement and architectural evolution.

## 🔧 REFACTORING PATTERNS OVERVIEW

Refactoring patterns provide systematic approaches to improving code structure, design, and maintainability while preserving functionality and minimizing risk.

### Pattern Categories

**Structural Patterns**
- Extract Method/Function
- Extract Class/Module
- Move Method/Property
- Inline Method/Variable

**Behavioral Patterns**
- Replace Conditional with Polymorphism
- Replace Magic Numbers with Constants
- Introduce Parameter Object
- Replace Nested Conditional with Guard Clauses

**Architectural Patterns**
- Separate Concerns
- Introduce Layer
- Extract Service
- Consolidate Duplicate Code

## 🏗️ STRUCTURAL REFACTORING PATTERNS

### Extract Method Pattern

**Problem**: Long methods with multiple responsibilities
**Solution**: Break down into smaller, focused methods

```typescript
// Before: Long method with multiple responsibilities
class TaskProcessor {
  processTask(task: Task): TaskResult {
    // Validation logic (20 lines)
    if (!task.id || task.id.length === 0) {
      throw new Error('Task ID is required');
    }
    if (!task.name || task.name.trim().length === 0) {
      throw new Error('Task name is required');
    }
    if (!['LOW', 'MEDIUM', 'HIGH', 'CRITICAL'].includes(task.priority)) {
      throw new Error('Invalid priority');
    }

    // Processing logic (30 lines)
    const startTime = Date.now();
    let result = { id: task.id, status: 'processing' };

    if (task.type === 'ANALYSIS') {
      result = this.performAnalysis(task);
    } else if (task.type === 'IMPLEMENTATION') {
      result = this.performImplementation(task);
    } else if (task.type === 'TESTING') {
      result = this.performTesting(task);
    }

    // Logging logic (15 lines)
    const endTime = Date.now();
    const duration = endTime - startTime;
    console.log(`Task ${task.id} processed in ${duration}ms`);
    console.log(`Result: ${JSON.stringify(result)}`);

    return result;
  }
}

// After: Extracted methods with single responsibilities
class TaskProcessor {
  processTask(task: Task): TaskResult {
    this.validateTask(task);
    const result = this.executeTask(task);
    this.logTaskCompletion(task, result);
    return result;
  }

  private validateTask(task: Task): void {
    this.validateTaskId(task.id);
    this.validateTaskName(task.name);
    this.validateTaskPriority(task.priority);
  }

  private validateTaskId(id: string): void {
    if (!id || id.length === 0) {
      throw new Error('Task ID is required');
    }
  }

  private validateTaskName(name: string): void {
    if (!name || name.trim().length === 0) {
      throw new Error('Task name is required');
    }
  }

  private validateTaskPriority(priority: string): void {
    const validPriorities = ['LOW', 'MEDIUM', 'HIGH', 'CRITICAL'];
    if (!validPriorities.includes(priority)) {
      throw new Error('Invalid priority');
    }
  }

  private executeTask(task: Task): TaskResult {
    const startTime = Date.now();

    switch (task.type) {
      case 'ANALYSIS':
        return this.performAnalysis(task);
      case 'IMPLEMENTATION':
        return this.performImplementation(task);
      case 'TESTING':
        return this.performTesting(task);
      default:
        throw new Error(`Unknown task type: ${task.type}`);
    }
  }

  private logTaskCompletion(task: Task, result: TaskResult): void {
    const duration = result.metadata?.duration || 0;
    console.log(`Task ${task.id} processed in ${duration}ms`);
    console.log(`Result: ${JSON.stringify(result)}`);
  }
}
```

### Extract Class Pattern

**Problem**: Class with too many responsibilities
**Solution**: Split into multiple focused classes

```typescript
// Before: God class with multiple responsibilities
class MemoryBankManager {
  // Task management
  createTask(task: Task): void { /* ... */ }
  updateTask(id: string, updates: Partial<Task>): void { /* ... */ }
  deleteTask(id: string): void { /* ... */ }

  // File operations
  readFile(path: string): string { /* ... */ }
  writeFile(path: string, content: string): void { /* ... */ }
  deleteFile(path: string): void { /* ... */ }

  // Configuration management
  loadConfig(): Configuration { /* ... */ }
  saveConfig(config: Configuration): void { /* ... */ }
  validateConfig(config: Configuration): boolean { /* ... */ }

  // Mode management
  switchMode(mode: string): void { /* ... */ }
  getCurrentMode(): string { /* ... */ }
  validateModeTransition(from: string, to: string): boolean { /* ... */ }
}

// After: Separated into focused classes
class TaskManager {
  createTask(task: Task): void { /* ... */ }
  updateTask(id: string, updates: Partial<Task>): void { /* ... */ }
  deleteTask(id: string): void { /* ... */ }
  getTasks(): Task[] { /* ... */ }
}

class FileManager {
  readFile(path: string): string { /* ... */ }
  writeFile(path: string, content: string): void { /* ... */ }
  deleteFile(path: string): void { /* ... */ }
  fileExists(path: string): boolean { /* ... */ }
}

class ConfigurationManager {
  loadConfig(): Configuration { /* ... */ }
  saveConfig(config: Configuration): void { /* ... */ }
  validateConfig(config: Configuration): boolean { /* ... */ }
  getDefaultConfig(): Configuration { /* ... */ }
}

class ModeManager {
  switchMode(mode: string): void { /* ... */ }
  getCurrentMode(): string { /* ... */ }
  validateModeTransition(from: string, to: string): boolean { /* ... */ }
  getAvailableModes(): string[] { /* ... */ }
}

// Coordinator class for high-level operations
class MemoryBankCoordinator {
  constructor(
    private taskManager: TaskManager,
    private fileManager: FileManager,
    private configManager: ConfigurationManager,
    private modeManager: ModeManager
  ) {}

  initializeSystem(): void {
    const config = this.configManager.loadConfig();
    this.modeManager.switchMode(config.defaultMode);
    // ... other initialization
  }
}
```

### Move Method Pattern

**Problem**: Method belongs in a different class
**Solution**: Move method to appropriate class

```typescript
// Before: Method in wrong class
class Task {
  id: string;
  name: string;
  priority: string;

  // This method doesn't belong here
  formatTaskForDisplay(): string {
    return `[${this.priority}] ${this.name} (${this.id})`;
  }

  // This method doesn't belong here either
  saveToFile(filePath: string): void {
    const content = JSON.stringify(this);
    fs.writeFileSync(filePath, content);
  }
}

// After: Methods moved to appropriate classes
class Task {
  id: string;
  name: string;
  priority: string;

  // Only data and core business logic
  isHighPriority(): boolean {
    return this.priority === 'HIGH' || this.priority === 'CRITICAL';
  }
}

class TaskFormatter {
  formatForDisplay(task: Task): string {
    return `[${task.priority}] ${task.name} (${task.id})`;
  }

  formatForExport(task: Task): string {
    return `${task.id},${task.name},${task.priority}`;
  }
}

class TaskPersistence {
  saveToFile(task: Task, filePath: string): void {
    const content = JSON.stringify(task);
    fs.writeFileSync(filePath, content);
  }

  loadFromFile(filePath: string): Task {
    const content = fs.readFileSync(filePath, 'utf-8');
    return JSON.parse(content);
  }
}
```

## 🎯 BEHAVIORAL REFACTORING PATTERNS

### Replace Conditional with Polymorphism

**Problem**: Complex conditional logic based on type
**Solution**: Use polymorphism for type-specific behavior

```typescript
// Before: Complex conditional logic
class TaskProcessor {
  processTask(task: Task): TaskResult {
    if (task.type === 'ANALYSIS') {
      // Analysis-specific logic
      const requirements = this.extractRequirements(task);
      const complexity = this.assessComplexity(requirements);
      return {
        id: task.id,
        type: 'ANALYSIS',
        result: { requirements, complexity }
      };
    } else if (task.type === 'IMPLEMENTATION') {
      // Implementation-specific logic
      const plan = this.createImplementationPlan(task);
      const code = this.generateCode(plan);
      return {
        id: task.id,
        type: 'IMPLEMENTATION',
        result: { plan, code }
      };
    } else if (task.type === 'TESTING') {
      // Testing-specific logic
      const testCases = this.generateTestCases(task);
      const results = this.runTests(testCases);
      return {
        id: task.id,
        type: 'TESTING',
        result: { testCases, results }
      };
    } else {
      throw new Error(`Unknown task type: ${task.type}`);
    }
  }
}

// After: Polymorphic approach
interface TaskProcessor {
  processTask(task: Task): TaskResult;
}

class AnalysisTaskProcessor implements TaskProcessor {
  processTask(task: Task): TaskResult {
    const requirements = this.extractRequirements(task);
    const complexity = this.assessComplexity(requirements);
    return {
      id: task.id,
      type: 'ANALYSIS',
      result: { requirements, complexity }
    };
  }

  private extractRequirements(task: Task): Requirements {
    // Analysis-specific logic
    return new Requirements(task.description);
  }

  private assessComplexity(requirements: Requirements): ComplexityLevel {
    // Complexity assessment logic
    return requirements.calculateComplexity();
  }
}

class ImplementationTaskProcessor implements TaskProcessor {
  processTask(task: Task): TaskResult {
    const plan = this.createImplementationPlan(task);
    const code = this.generateCode(plan);
    return {
      id: task.id,
      type: 'IMPLEMENTATION',
      result: { plan, code }
    };
  }

  private createImplementationPlan(task: Task): ImplementationPlan {
    // Implementation planning logic
    return new ImplementationPlan(task);
  }

  private generateCode(plan: ImplementationPlan): GeneratedCode {
    // Code generation logic
    return plan.generateCode();
  }
}

class TestingTaskProcessor implements TaskProcessor {
  processTask(task: Task): TaskResult {
    const testCases = this.generateTestCases(task);
    const results = this.runTests(testCases);
    return {
      id: task.id,
      type: 'TESTING',
      result: { testCases, results }
    };
  }

  private generateTestCases(task: Task): TestCase[] {
    // Test case generation logic
    return TestCaseGenerator.generate(task);
  }

  private runTests(testCases: TestCase[]): TestResult[] {
    // Test execution logic
    return TestRunner.execute(testCases);
  }
}

// Factory for creating appropriate processors
class TaskProcessorFactory {
  private processors: Map<string, TaskProcessor> = new Map([
    ['ANALYSIS', new AnalysisTaskProcessor()],
    ['IMPLEMENTATION', new ImplementationTaskProcessor()],
    ['TESTING', new TestingTaskProcessor()]
  ]);

  createProcessor(taskType: string): TaskProcessor {
    const processor = this.processors.get(taskType);
    if (!processor) {
      throw new Error(`No processor found for task type: ${taskType}`);
    }
    return processor;
  }
}
```

### Replace Magic Numbers with Constants

**Problem**: Magic numbers scattered throughout code
**Solution**: Define meaningful constants

```typescript
// Before: Magic numbers everywhere
class TaskValidator {
  validateTask(task: Task): ValidationResult {
    if (task.name.length > 100) {
      return { valid: false, error: 'Name too long' };
    }

    if (task.description.length > 1000) {
      return { valid: false, error: 'Description too long' };
    }

    if (task.estimatedHours < 0.5 || task.estimatedHours > 40) {
      return { valid: false, error: 'Invalid time estimate' };
    }

    if (task.priority < 1 || task.priority > 4) {
      return { valid: false, error: 'Invalid priority' };
    }

    return { valid: true };
  }
}

// After: Meaningful constants
class TaskValidator {
  private static readonly MAX_NAME_LENGTH = 100;
  private static readonly MAX_DESCRIPTION_LENGTH = 1000;
  private static readonly MIN_ESTIMATED_HOURS = 0.5;
  private static readonly MAX_ESTIMATED_HOURS = 40;
  private static readonly MIN_PRIORITY = 1;
  private static readonly MAX_PRIORITY = 4;

  validateTask(task: Task): ValidationResult {
    if (task.name.length > TaskValidator.MAX_NAME_LENGTH) {
      return {
        valid: false,
        error: `Name exceeds maximum length of ${TaskValidator.MAX_NAME_LENGTH} characters`
      };
    }

    if (task.description.length > TaskValidator.MAX_DESCRIPTION_LENGTH) {
      return {
        valid: false,
        error: `Description exceeds maximum length of ${TaskValidator.MAX_DESCRIPTION_LENGTH} characters`
      };
    }

    if (task.estimatedHours < TaskValidator.MIN_ESTIMATED_HOURS ||
        task.estimatedHours > TaskValidator.MAX_ESTIMATED_HOURS) {
      return {
        valid: false,
        error: `Estimated hours must be between ${TaskValidator.MIN_ESTIMATED_HOURS} and ${TaskValidator.MAX_ESTIMATED_HOURS}`
      };
    }

    if (task.priority < TaskValidator.MIN_PRIORITY ||
        task.priority > TaskValidator.MAX_PRIORITY) {
      return {
        valid: false,
        error: `Priority must be between ${TaskValidator.MIN_PRIORITY} and ${TaskValidator.MAX_PRIORITY}`
      };
    }

    return { valid: true };
  }
}

// Even better: Use enums and configuration
enum TaskPriority {
  LOW = 1,
  MEDIUM = 2,
  HIGH = 3,
  CRITICAL = 4
}

interface TaskValidationConfig {
  maxNameLength: number;
  maxDescriptionLength: number;
  minEstimatedHours: number;
  maxEstimatedHours: number;
}

class ConfigurableTaskValidator {
  constructor(private config: TaskValidationConfig) {}

  validateTask(task: Task): ValidationResult {
    const nameValidation = this.validateName(task.name);
    if (!nameValidation.valid) return nameValidation;

    const descriptionValidation = this.validateDescription(task.description);
    if (!descriptionValidation.valid) return descriptionValidation;

    const hoursValidation = this.validateEstimatedHours(task.estimatedHours);
    if (!hoursValidation.valid) return hoursValidation;

    const priorityValidation = this.validatePriority(task.priority);
    if (!priorityValidation.valid) return priorityValidation;

    return { valid: true };
  }

  private validateName(name: string): ValidationResult {
    if (name.length > this.config.maxNameLength) {
      return {
        valid: false,
        error: `Name exceeds maximum length of ${this.config.maxNameLength} characters`
      };
    }
    return { valid: true };
  }

  private validateDescription(description: string): ValidationResult {
    if (description.length > this.config.maxDescriptionLength) {
      return {
        valid: false,
        error: `Description exceeds maximum length of ${this.config.maxDescriptionLength} characters`
      };
    }
    return { valid: true };
  }

  private validateEstimatedHours(hours: number): ValidationResult {
    if (hours < this.config.minEstimatedHours || hours > this.config.maxEstimatedHours) {
      return {
        valid: false,
        error: `Estimated hours must be between ${this.config.minEstimatedHours} and ${this.config.maxEstimatedHours}`
      };
    }
    return { valid: true };
  }

  private validatePriority(priority: TaskPriority): ValidationResult {
    if (!Object.values(TaskPriority).includes(priority)) {
      return {
        valid: false,
        error: `Invalid priority. Must be one of: ${Object.values(TaskPriority).join(', ')}`
      };
    }
    return { valid: true };
  }
}
```

## 🏛️ ARCHITECTURAL REFACTORING PATTERNS

### Introduce Layer Pattern

**Problem**: Mixed concerns and tight coupling
**Solution**: Introduce architectural layers

```typescript
// Before: Mixed concerns
class TaskService {
  processTask(taskData: any): any {
    // Data validation mixed with business logic
    if (!taskData.id) throw new Error('ID required');

    // Database access mixed with business logic
    const existingTask = database.query('SELECT * FROM tasks WHERE id = ?', [taskData.id]);
    if (existingTask) throw new Error('Task already exists');

    // Business logic mixed with data access
    const task = {
      id: taskData.id,
      name: taskData.name,
      status: 'CREATED',
      createdAt: new Date()
    };

    // Direct database manipulation
    database.execute('INSERT INTO tasks VALUES (?, ?, ?, ?)',
      [task.id, task.name, task.status, task.createdAt]);

    // Direct response formatting
    return {
      success: true,
      task: {
        id: task.id,
        name: task.name,
        status: task.status
      }
    };
  }
}

// After: Layered architecture
// Presentation Layer
class TaskController {
  constructor(private taskService: TaskService) {}

  async createTask(request: CreateTaskRequest): Promise<CreateTaskResponse> {
    try {
      const task = await this.taskService.createTask(request);
      return {
        success: true,
        data: this.formatTaskResponse(task)
      };
    } catch (error) {
      return {
        success: false,
        error: error.message
      };
    }
  }

  private formatTaskResponse(task: Task): TaskResponse {
    return {
      id: task.id,
      name: task.name,
      status: task.status,
      createdAt: task.createdAt.toISOString()
    };
  }
}

// Business Logic Layer
class TaskService {
  constructor(
    private taskRepository: TaskRepository,
    private taskValidator: TaskValidator
  ) {}

  async createTask(request: CreateTaskRequest): Promise<Task> {
    // Validate input
    const validation = this.taskValidator.validate(request);
    if (!validation.valid) {
      throw new Error(validation.error);
    }

    // Check business rules
    const existingTask = await this.taskRepository.findById(request.id);
    if (existingTask) {
      throw new Error('Task already exists');
    }

    // Create domain object
    const task = new Task({
      id: request.id,
      name: request.name,
      status: TaskStatus.CREATED,
      createdAt: new Date()
    });

    // Persist through repository
    return await this.taskRepository.save(task);
  }
}

// Data Access Layer
interface TaskRepository {
  findById(id: string): Promise<Task | null>;
  save(task: Task): Promise<Task>;
  delete(id: string): Promise<void>;
}

class DatabaseTaskRepository implements TaskRepository {
  constructor(private database: Database) {}

  async findById(id: string): Promise<Task | null> {
    const row = await this.database.query(
      'SELECT * FROM tasks WHERE id = ?',
      [id]
    );

    return row ? this.mapRowToTask(row) : null;
  }

  async save(task: Task): Promise<Task> {
    await this.database.execute(
      'INSERT INTO tasks (id, name, status, created_at) VALUES (?, ?, ?, ?)',
      [task.id, task.name, task.status, task.createdAt]
    );

    return task;
  }

  async delete(id: string): Promise<void> {
    await this.database.execute('DELETE FROM tasks WHERE id = ?', [id]);
  }

  private mapRowToTask(row: any): Task {
    return new Task({
      id: row.id,
      name: row.name,
      status: row.status,
      createdAt: new Date(row.created_at)
    });
  }
}

// Domain Layer
class Task {
  constructor(
    public readonly id: string,
    public readonly name: string,
    public status: TaskStatus,
    public readonly createdAt: Date
  ) {}

  markAsCompleted(): void {
    if (this.status === TaskStatus.COMPLETED) {
      throw new Error('Task is already completed');
    }
    this.status = TaskStatus.COMPLETED;
  }

  isOverdue(): boolean {
    const daysSinceCreation = (Date.now() - this.createdAt.getTime()) / (1000 * 60 * 60 * 24);
    return daysSinceCreation > 30; // Business rule: tasks are overdue after 30 days
  }
}

enum TaskStatus {
  CREATED = 'CREATED',
  IN_PROGRESS = 'IN_PROGRESS',
  COMPLETED = 'COMPLETED',
  CANCELLED = 'CANCELLED'
}
```

## 📊 REFACTORING METRICS AND VALIDATION

### Measuring Refactoring Success

```typescript
interface RefactoringMetrics {
  codeComplexity: {
    before: number;
    after: number;
    improvement: number;
  };
  testCoverage: {
    before: number;
    after: number;
    improvement: number;
  };
  maintainabilityIndex: {
    before: number;
    after: number;
    improvement: number;
  };
  performanceMetrics: {
    before: PerformanceSnapshot;
    after: PerformanceSnapshot;
    improvement: PerformanceImprovement;
  };
}

class RefactoringValidator {
  async validateRefactoring(
    beforeSnapshot: CodeSnapshot,
    afterSnapshot: CodeSnapshot
  ): Promise<RefactoringValidation> {
    return {
      functionalityPreserved: await this.validateFunctionality(beforeSnapshot, afterSnapshot),
      qualityImproved: this.validateQualityImprovement(beforeSnapshot, afterSnapshot),
      performanceImpact: await this.validatePerformanceImpact(beforeSnapshot, afterSnapshot),
      testCoverageImpact: this.validateTestCoverage(beforeSnapshot, afterSnapshot)
    };
  }

  private async validateFunctionality(
    before: CodeSnapshot,
    after: CodeSnapshot
  ): Promise<FunctionalityValidation> {
    // Run comprehensive test suite
    const beforeTests = await this.runTestSuite(before);
    const afterTests = await this.runTestSuite(after);

    return {
      allTestsPass: afterTests.allPassed,
      testResultsMatch: this.compareTestResults(beforeTests, afterTests),
      newFailures: this.identifyNewFailures(beforeTests, afterTests)
    };
  }
}
```

This comprehensive collection of refactoring patterns provides systematic approaches to improving Memory Bank code quality, maintainability, and architectural design.