---
description: "Test organization and structure rules for Memory Bank development"
globs: "**/testing/**", "**/test-organization/**", "**/test-structure/**"
alwaysApply: false
---

# TEST ORGANIZATION RULES

> **TL;DR:** This rule defines comprehensive test organization and structure methodologies for Memory Bank development, ensuring maintainable and scalable test suites.

## 🎯 TEST ORGANIZATION OVERVIEW

Test organization focuses on creating a logical, maintainable, and scalable structure for all tests in the Memory Bank system, enabling efficient test execution and maintenance.

### Core Principles

**Hierarchical Structure**
- Organize tests by feature and functionality
- Group related tests together
- Maintain clear naming conventions
- Separate unit, integration, and e2e tests

**Maintainability**
- Keep tests simple and focused
- Avoid test interdependencies
- Use shared utilities and fixtures
- Document test purposes clearly

## 📁 TEST DIRECTORY STRUCTURE

### Standard Test Layout

```
tests/
├── unit/                    # Unit tests
│   ├── memory-bank/
│   │   ├── modes/
│   │   │   ├── van.test.ts
│   │   │   ├── plan.test.ts
│   │   │   ├── creative.test.ts
│   │   │   ├── implement.test.ts
│   │   │   ├── reflect.test.ts
│   │   │   └── archive.test.ts
│   │   ├── tasks/
│   │   │   ├── task-manager.test.ts
│   │   │   ├── task-validation.test.ts
│   │   │   └── task-migration.test.ts
│   │   └── utils/
│   │       ├── file-utils.test.ts
│   │       ├── date-utils.test.ts
│   │       └── validation-utils.test.ts
├── integration/             # Integration tests
│   ├── mode-transitions/
│   │   ├── van-to-plan.test.ts
│   │   ├── plan-to-creative.test.ts
│   │   ├── creative-to-implement.test.ts
│   │   ├── implement-to-reflect.test.ts
│   │   └── reflect-to-archive.test.ts
│   ├── file-operations/
│   │   ├── task-file-management.test.ts
│   │   ├── config-file-handling.test.ts
│   │   └── archive-operations.test.ts
│   └── system-integration/
│       ├── git-integration.test.ts
│       ├── rule-system.test.ts
│       └── workflow-integration.test.ts
├── e2e/                     # End-to-end tests
│   ├── complete-workflows/
│   │   ├── level1-bug-fix.test.ts
│   │   ├── level2-enhancement.test.ts
│   │   ├── level3-feature.test.ts
│   │   └── level4-system.test.ts
│   ├── user-scenarios/
│   │   ├── new-user-onboarding.test.ts
│   │   ├── experienced-user-workflow.test.ts
│   │   └── collaborative-development.test.ts
│   └── edge-cases/
│       ├── error-recovery.test.ts
│       ├── data-corruption.test.ts
│       └── system-limits.test.ts
├── fixtures/                # Test data and fixtures
│   ├── sample-tasks/
│   ├── sample-configs/
│   ├── sample-archives/
│   └── mock-data/
├── helpers/                 # Test utilities and helpers
│   ├── test-setup.ts
│   ├── mock-factories.ts
│   ├── assertion-helpers.ts
│   └── cleanup-helpers.ts
└── config/                  # Test configuration
    ├── jest.config.js
    ├── test-env.ts
    └── global-setup.ts
```

## 🏷️ TEST NAMING CONVENTIONS

### File Naming

**Unit Tests**
- `[component-name].test.ts` - Component unit tests
- `[utility-name].test.ts` - Utility function tests
- `[service-name].test.ts` - Service class tests

**Integration Tests**
- `[feature-name]-integration.test.ts` - Feature integration
- `[system-a]-to-[system-b].test.ts` - System integration
- `[workflow-name]-workflow.test.ts` - Workflow tests

**E2E Tests**
- `[scenario-name]-e2e.test.ts` - End-to-end scenarios
- `[user-journey]-journey.test.ts` - User journey tests
- `[complete-workflow]-complete.test.ts` - Complete workflows

### Test Case Naming

**Descriptive Names**
```typescript
// Good: Descriptive and specific
describe('TaskManager', () => {
  describe('createTask', () => {
    test('should create task with valid input', () => {});
    test('should throw error when task name is empty', () => {});
    test('should assign unique ID to new task', () => {});
  });
});

// Bad: Vague and unclear
describe('TaskManager', () => {
  test('test1', () => {});
  test('test2', () => {});
  test('test3', () => {});
});
```

## 📊 TEST CATEGORIZATION

### By Test Type

**Unit Tests (60-70% of tests)**
- Test individual functions/methods
- Mock external dependencies
- Fast execution (<1ms per test)
- High code coverage target (>90%)

**Integration Tests (20-30% of tests)**
- Test component interactions
- Use real dependencies where possible
- Medium execution time (<100ms per test)
- Focus on interface contracts

**E2E Tests (5-15% of tests)**
- Test complete user workflows
- Use real system environment
- Slower execution (<5s per test)
- Focus on user value delivery

### By Priority Level

**P0 - Critical (Must Pass)**
- Core functionality tests
- Security-related tests
- Data integrity tests
- System stability tests

**P1 - High (Should Pass)**
- Feature functionality tests
- Performance tests
- User experience tests
- Integration tests

**P2 - Medium (Nice to Pass)**
- Edge case tests
- Optimization tests
- Compatibility tests
- Documentation tests

**P3 - Low (Optional)**
- Experimental feature tests
- Future enhancement tests
- Research tests
- Prototype tests

## 🔧 TEST UTILITIES AND HELPERS

### Common Test Utilities

```typescript
// test-setup.ts
export const setupTestEnvironment = () => {
  // Initialize test database
  // Setup mock file system
  // Configure test logging
  // Setup test data
};

export const cleanupTestEnvironment = () => {
  // Clean test database
  // Remove test files
  // Reset mocks
  // Clear test data
};
```

### Mock Factories

```typescript
// mock-factories.ts
export const createMockTask = (overrides = {}) => ({
  id: 'test-task-id',
  name: 'Test Task',
  status: 'IN_PROGRESS',
  priority: 'HIGH',
  created: new Date(),
  ...overrides
});

export const createMockConfig = (overrides = {}) => ({
  version: '1.0.0',
  mode: 'MANUAL',
  settings: {},
  ...overrides
});
```

### Assertion Helpers

```typescript
// assertion-helpers.ts
export const expectTaskToBeValid = (task) => {
  expect(task).toHaveProperty('id');
  expect(task).toHaveProperty('name');
  expect(task).toHaveProperty('status');
  expect(task.id).toMatch(/^[A-Z-]+-\d{4}-\d{2}-\d{2}$/);
};

export const expectFileToExist = async (filePath) => {
  const exists = await fs.pathExists(filePath);
  expect(exists).toBe(true);
};
```

## 📈 TEST EXECUTION STRATEGIES

### Test Suites

**Smoke Tests**
- Quick validation of core functionality
- Run on every commit
- Should complete in <30 seconds
- Catch major regressions

**Regression Tests**
- Comprehensive test suite
- Run on pull requests
- Should complete in <5 minutes
- Catch functional regressions

**Full Test Suite**
- Complete test coverage
- Run nightly or on releases
- May take 10-30 minutes
- Comprehensive quality validation

### Parallel Execution

```typescript
// jest.config.js
module.exports = {
  maxWorkers: '50%',
  testPathIgnorePatterns: ['/node_modules/', '/dist/'],
  testMatch: ['**/__tests__/**/*.test.ts'],
  collectCoverageFrom: [
    'src/**/*.ts',
    '!src/**/*.d.ts',
    '!src/tests/**'
  ]
};
```

## 🎯 TEST QUALITY METRICS

### Coverage Metrics

**Code Coverage Targets**
- Unit tests: >90% line coverage
- Integration tests: >80% feature coverage
- E2E tests: >70% user journey coverage

**Quality Metrics**
- Test reliability: >99% pass rate
- Test performance: <5s average execution
- Test maintainability: <2 hours to update per feature
- Test documentation: 100% test purpose documented

### Success Indicators

**EXCELLENT Test Organization**
- Clear structure and naming
- Comprehensive coverage
- Fast and reliable execution
- Easy maintenance and updates

**GOOD Test Organization**
- Mostly clear structure
- Good coverage
- Reasonable execution time
- Manageable maintenance

**NEEDS IMPROVEMENT**
- Unclear organization
- Gaps in coverage
- Slow or flaky tests
- Difficult maintenance

This test organization framework ensures maintainable, scalable, and effective testing for the Memory Bank system.
