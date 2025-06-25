---
description: TypeScript Language Adapter for Universal Testing
globs: typescript-adapter.mdc, typescript-testing.mdc, **/typescript-test-*.mdc
alwaysApply: false
---

# TYPESCRIPT LANGUAGE ADAPTER

> **TL;DR:** TypeScript adapter supporting multiple testing frameworks with type safety, advanced tooling, and TypeScript-specific optimizations. Implements Rules #8-16 with full type checking integration.

## 🎯 SUPPORTED ENVIRONMENTS
- **TypeScript 4.5+, 5.0+** | **Bun, Jest, Vitest, Mocha** | **Type checking integration**

## 🔍 DETECTION
```yaml
typescript_detection:
  indicators: ["*.ts", "*.tsx", "tsconfig.json", "package.json"]
  frameworks:
    bun: "bun:test imports in *.test.ts"
    jest: "@types/jest in package.json"
    vitest: "vitest in package.json"
    mocha: "@types/mocha in package.json"
  build_system:
    typescript: "tsconfig.json exists"
    package_manager: "package.json with typescript dependency"
```

## 🎯 UNIVERSAL RULES

### Rule #8: Granular Tests (AAA Pattern with Types)
```typescript
import { expect, test, describe } from "bun:test";
import type { User, UserInput } from "../src/types/user";
import { UserService } from "../src/services/user";

describe("UserService", () => {
  test("should create user with valid typed input", () => {
    // Arrange
    const userInput: UserInput = {
      name: "John Doe",
      email: "john@example.com",
      age: 30
    };
    const userService = new UserService();

    // Act
    const result: User = userService.createUser(userInput);

    // Assert
    expect(result.id).toBeDefined();
    expect(result.name).toBe(userInput.name);
    expect(result.email).toBe(userInput.email);
    expect(result.createdAt).toBeInstanceOf(Date);
  });

  test("should reject invalid email with type safety", () => {
    // Arrange
    const invalidInput: UserInput = {
      name: "John Doe",
      email: "invalid-email", // TypeScript catches this at compile time
      age: 30
    };
    const userService = new UserService();

    // Act & Assert
    expect(() => userService.createUser(invalidInput)).toThrow("Invalid email format");
  });
});

// Type-safe test helper
function createTestUser(overrides: Partial<UserInput> = {}): UserInput {
  return {
    name: "Test User",
    email: "test@example.com",
    age: 25,
    ...overrides
  };
}
```

### Rule #9: Test Isolation (TypeScript with Cleanup)
```typescript
import { beforeEach, afterEach, test, describe } from "bun:test";
import type { Database } from "../src/database";
import { createTestDatabase } from "../test/helpers/database";

describe("Database operations with TypeScript", () => {
  let db: Database;
  let cleanup: (() => Promise<void>) | null = null;

  beforeEach(async () => {
    // Type-safe setup with proper cleanup tracking
    const { database, cleanupFn } = await createTestDatabase();
    db = database;
    cleanup = cleanupFn;

    // Ensure clean state with type validation
    await db.clear();
    const count = await db.count();
    expect(count).toBe(0);
  });

  afterEach(async () => {
    // Type-safe cleanup
    if (cleanup) {
      await cleanup();
      cleanup = null;
    }
    // TypeScript ensures db is properly typed
    db = null as any;
  });

  test("should insert user with type safety", async () => {
    // Test runs in isolation with full type checking
    const userData: UserInput = createTestUser();
    const user: User = await db.users.insert(userData);

    expect(user.id).toBeDefined();
    expect(user.name).toBe(userData.name);
  });

  test("should handle concurrent operations safely", async () => {
    // TypeScript ensures type safety in concurrent operations
    const operations: Promise<User>[] = [
      db.users.insert(createTestUser({ name: "User 1" })),
      db.users.insert(createTestUser({ name: "User 2" })),
      db.users.insert(createTestUser({ name: "User 3" }))
    ];

    const results: User[] = await Promise.all(operations);
    expect(results).toHaveLength(3);
    results.forEach(user => expect(user.id).toBeDefined());
  });
});
```

### Rule #10: Feature Testing (TypeScript Modules + Type Coverage)
```typescript
// Feature: User Authentication with TypeScript
import type { AuthResult, LoginCredentials, AuthToken } from "../src/types/auth";
import { AuthService } from "../src/services/auth";
import { TokenManager } from "../src/utils/token";

describe("User Authentication Feature (TypeScript)", () => {
  // Unit tests with type safety
  describe("Password validation", () => {
    test("should validate password strength with types", () => {
      const authService = new AuthService();

      // TypeScript ensures correct parameter types
      const strongPassword = "StrongP@ss123!";
      const result: boolean = authService.validatePasswordStrength(strongPassword);

      expect(result).toBe(true);
    });

    test("should reject weak password with typed error", () => {
      const authService = new AuthService();

      expect(() => {
        authService.validatePasswordStrength("weak");
      }).toThrow("Password does not meet security requirements");
    });
  });

  // Integration tests with typed interfaces
  describe("Login flow with type safety", () => {
    test("should authenticate valid user with typed result", async () => {
      const credentials: LoginCredentials = {
        email: "user@example.com",
        password: "validPassword123!"
      };

      const authService = new AuthService();
      const result: AuthResult = await authService.authenticate(credentials);

      expect(result.success).toBe(true);
      expect(result.token).toBeDefined();
      expect(result.user.email).toBe(credentials.email);
    });

    test("should handle authentication failure with typed error", async () => {
      const invalidCredentials: LoginCredentials = {
        email: "user@example.com",
        password: "wrongPassword"
      };

      const authService = new AuthService();
      const result: AuthResult = await authService.authenticate(invalidCredentials);

      expect(result.success).toBe(false);
      expect(result.error).toBeDefined();
      expect(result.token).toBeNull();
    });
  });

  // End-to-end tests with full type checking
  describe("Complete authentication workflow", () => {
    test("should complete full typed login process", async () => {
      const credentials: LoginCredentials = {
        email: "test@example.com",
        password: "TestPass123!"
      };

      // Type-safe workflow
      const authService = new AuthService();
      const tokenManager = new TokenManager();

      // Step 1: Authenticate
      const authResult: AuthResult = await authService.authenticate(credentials);
      expect(authResult.success).toBe(true);

      // Step 2: Validate token
      const token: AuthToken = authResult.token!;
      const isValid: boolean = await tokenManager.validateToken(token);
      expect(isValid).toBe(true);

      // Step 3: Extract user info
      const userInfo = await tokenManager.extractUserInfo(token);
      expect(userInfo.email).toBe(credentials.email);
    });
  });
});
```

### Rule #11: Coverage (TypeScript + Type Coverage)
```bash
# TypeScript-aware coverage with type checking
npx tsc --noEmit && bun test --coverage
npx vitest run --coverage --typecheck

# Type coverage analysis
npx type-coverage --detail --strict
```

```typescript
// Type-safe coverage configuration
interface CoverageConfig {
  lines: number;
  functions: number;
  branches: number;
  statements: number;
  typeCoverage: number; // TypeScript-specific
}

const coverageThresholds: CoverageConfig = {
  lines: 85,
  functions: 90,
  branches: 80,
  statements: 85,
  typeCoverage: 95 // Ensure high type coverage
};

// Test to verify coverage meets TypeScript standards
test("should meet TypeScript coverage requirements", async () => {
  const coverage = await getCoverageReport();

  expect(coverage.lines).toBeGreaterThanOrEqual(coverageThresholds.lines);
  expect(coverage.functions).toBeGreaterThanOrEqual(coverageThresholds.functions);
  expect(coverage.typeCoverage).toBeGreaterThanOrEqual(coverageThresholds.typeCoverage);
});
```

### Rule #12: Edge Cases (TypeScript Type Guards + Boundary Testing)
```typescript
import type { ApiResponse, ErrorResponse } from "../src/types/api";

describe("TypeScript Edge Cases", () => {
  // Type guard testing
  function isErrorResponse(response: ApiResponse): response is ErrorResponse {
    return 'error' in response && 'code' in response;
  }

  test("should handle null and undefined with strict types", () => {
    type NullableString = string | null | undefined;

    function processNullableString(value: NullableString): string {
      return value ?? "default";
    }

    expect(processNullableString(null)).toBe("default");
    expect(processNullableString(undefined)).toBe("default");
    expect(processNullableString("")).toBe("");
    expect(processNullableString("valid")).toBe("valid");
  });

  test("should handle union types safely", () => {
    type Status = "pending" | "completed" | "failed";

    function handleStatus(status: Status): string {
      switch (status) {
        case "pending":
          return "Processing...";
        case "completed":
          return "Done!";
        case "failed":
          return "Error occurred";
        default:
          // TypeScript ensures exhaustive checking
          const _exhaustive: never = status;
          throw new Error(`Unhandled status: ${_exhaustive}`);
      }
    }

    expect(handleStatus("pending")).toBe("Processing...");
    expect(handleStatus("completed")).toBe("Done!");
    expect(handleStatus("failed")).toBe("Error occurred");
  });

  test("should handle generic constraints safely", () => {
    interface Identifiable {
      id: string;
    }

    function findById<T extends Identifiable>(items: T[], id: string): T | undefined {
      return items.find(item => item.id === id);
    }

    const users = [
      { id: "1", name: "John" },
      { id: "2", name: "Jane" }
    ];

    const found = findById(users, "1");
    expect(found?.name).toBe("John");

    const notFound = findById(users, "999");
    expect(notFound).toBeUndefined();
  });

  test("should handle API response types with type guards", async () => {
    const mockApiCall = (): Promise<ApiResponse> => {
      return Promise.resolve({
        error: "Not found",
        code: 404
      } as ErrorResponse);
    };

    const response = await mockApiCall();

    if (isErrorResponse(response)) {
      expect(response.error).toBe("Not found");
      expect(response.code).toBe(404);
    } else {
      fail("Expected error response");
    }
  });
});
```

### Rule #13: Performance Testing (TypeScript + Benchmarking)
```typescript
import { bench, run } from "bun:test";
import type { PerformanceMetrics, BenchmarkResult } from "../src/types/performance";

describe("TypeScript Performance Tests", () => {
  interface PerformanceTest {
    name: string;
    operation: () => void;
    expectedMaxDuration: number;
  }

  test("should process large typed dataset within time limit", async () => {
    interface DataItem {
      id: number;
      value: string;
      timestamp: Date;
    }

    const generateTypedDataset = (size: number): DataItem[] => {
      return Array.from({ length: size }, (_, i) => ({
        id: i,
        value: `item-${i}`,
        timestamp: new Date()
      }));
    };

    const largeDataset: DataItem[] = generateTypedDataset(10000);

    const start = performance.now();
    const processed: DataItem[] = largeDataset
      .filter(item => item.id % 2 === 0)
      .map(item => ({ ...item, value: item.value.toUpperCase() }));
    const duration = performance.now() - start;

    expect(processed.length).toBe(5000);
    expect(duration).toBeLessThan(100); // Should complete within 100ms
  });

  // Type-safe benchmarking
  const performanceTests: PerformanceTest[] = [
    {
      name: "Array operations",
      operation: () => {
        const arr = Array(1000).fill(0).map((_, i) => i);
        return arr.reduce((sum, val) => sum + val, 0);
      },
      expectedMaxDuration: 10
    },
    {
      name: "Object manipulation",
      operation: () => {
        const obj: Record<string, number> = {};
        for (let i = 0; i < 1000; i++) {
          obj[`key${i}`] = i * 2;
        }
        return Object.values(obj).length;
      },
      expectedMaxDuration: 15
    }
  ];

  performanceTests.forEach(({ name, operation, expectedMaxDuration }) => {
    test(`should execute ${name} within expected time`, () => {
      const start = performance.now();
      const result = operation();
      const duration = performance.now() - start;

      expect(result).toBeDefined();
      expect(duration).toBeLessThan(expectedMaxDuration);
    });
  });
});

// Benchmark with TypeScript types
bench("typed array processing", () => {
  interface Item {
    id: number;
    name: string;
  }

  const items: Item[] = Array.from({ length: 1000 }, (_, i) => ({
    id: i,
    name: `item-${i}`
  }));

  return items.filter(item => item.id % 2 === 0).length;
});
```

### Rule #14: Precise Timing (TypeScript High-Resolution)
```typescript
import type { TimingResult, PerformanceReport } from "../src/types/timing";

interface TimedOperation<T> {
  result: T;
  duration: number;
  startTime: number;
  endTime: number;
}

class TypeScriptTimer {
  static measure<T>(operation: () => T): TimedOperation<T> {
    const startTime = performance.now();
    const result = operation();
    const endTime = performance.now();

    return {
      result,
      duration: endTime - startTime,
      startTime,
      endTime
    };
  }

  static async measureAsync<T>(operation: () => Promise<T>): Promise<TimedOperation<T>> {
    const startTime = performance.now();
    const result = await operation();
    const endTime = performance.now();

    return {
      result,
      duration: endTime - startTime,
      startTime,
      endTime
    };
  }
}

describe("TypeScript Precise Timing", () => {
  test("should measure synchronous operation timing", () => {
    const operation = () => {
      // Simulate computational work
      let sum = 0;
      for (let i = 0; i < 100000; i++) {
        sum += Math.sqrt(i);
      }
      return sum;
    };

    const timing: TimedOperation<number> = TypeScriptTimer.measure(operation);

    expect(timing.result).toBeGreaterThan(0);
    expect(timing.duration).toBeGreaterThan(0);
    expect(timing.endTime).toBeGreaterThan(timing.startTime);

    console.log(`Operation completed in ${timing.duration.toFixed(3)}ms`);
  });

  test("should measure asynchronous operation timing", async () => {
    const asyncOperation = async (): Promise<string> => {
      await new Promise(resolve => setTimeout(resolve, 10));
      return "completed";
    };

    const timing: TimedOperation<string> = await TypeScriptTimer.measureAsync(asyncOperation);

    expect(timing.result).toBe("completed");
    expect(timing.duration).toBeGreaterThanOrEqual(10);
    expect(timing.duration).toBeLessThan(50); // Should not take too long
  });

  test("should create performance report with types", () => {
    const measurements: TimingResult[] = [];

    // Perform multiple measurements
    for (let i = 0; i < 10; i++) {
      const timing = TypeScriptTimer.measure(() => Math.random() * 1000);
      measurements.push({
        operation: `test-${i}`,
        duration: timing.duration,
        timestamp: new Date()
      });
    }

    const report: PerformanceReport = {
      totalMeasurements: measurements.length,
      averageDuration: measurements.reduce((sum, m) => sum + m.duration, 0) / measurements.length,
      minDuration: Math.min(...measurements.map(m => m.duration)),
      maxDuration: Math.max(...measurements.map(m => m.duration)),
      measurements
    };

    expect(report.totalMeasurements).toBe(10);
    expect(report.averageDuration).toBeGreaterThan(0);
    expect(report.minDuration).toBeLessThanOrEqual(report.maxDuration);
  });
});
```

### Rule #15: Secure ID (TypeScript Crypto + Type Safety)
```typescript
import { randomBytes, createHash } from "crypto";
import type { SecureId, IdGenerationOptions, IdValidationResult } from "../src/types/security";

class TypeScriptSecureIdGenerator {
  static generateSecureId(options: IdGenerationOptions = {}): SecureId {
    const {
      length = 32,
      format = "hex",
      includeTimestamp = false
    } = options;

    const randomData = randomBytes(length);
    let id: string;

    switch (format) {
      case "hex":
        id = randomData.toString("hex");
        break;
      case "base64":
        id = randomData.toString("base64url");
        break;
      default:
        throw new Error(`Unsupported format: ${format}`);
    }

    if (includeTimestamp) {
      const timestamp = Date.now().toString(36);
      id = `${timestamp}-${id}`;
    }

    return {
      value: id,
      format,
      length: id.length,
      generatedAt: new Date(),
      entropy: length * 8
    };
  }

  static validateId(id: SecureId): IdValidationResult {
    const isValid = id.value.length >= 16 && id.entropy >= 128;

    return {
      isValid,
      entropy: id.entropy,
      format: id.format,
      issues: isValid ? [] : ["Insufficient entropy", "Too short"]
    };
  }
}

describe("TypeScript Secure ID Generation", () => {
  test("should generate unique secure IDs with type safety", () => {
    const ids = new Set<string>();
    const generatedIds: SecureId[] = [];

    // Generate multiple IDs
    for (let i = 0; i < 10000; i++) {
      const secureId: SecureId = TypeScriptSecureIdGenerator.generateSecureId({
        length: 32,
        format: "hex"
      });

      expect(ids.has(secureId.value)).toBe(false);
      ids.add(secureId.value);
      generatedIds.push(secureId);
    }

    expect(ids.size).toBe(10000);

    // Verify all IDs have correct properties
    generatedIds.forEach(id => {
      expect(id.value).toMatch(/^[a-f0-9]{64}$/);
      expect(id.format).toBe("hex");
      expect(id.entropy).toBe(256);
      expect(id.generatedAt).toBeInstanceOf(Date);
    });
  });

  test("should validate ID security with typed results", () => {
    const strongId: SecureId = TypeScriptSecureIdGenerator.generateSecureId({
      length: 32,
      format: "hex"
    });

    const validation: IdValidationResult = TypeScriptSecureIdGenerator.validateId(strongId);

    expect(validation.isValid).toBe(true);
    expect(validation.entropy).toBeGreaterThanOrEqual(128);
    expect(validation.issues).toHaveLength(0);
  });

  test("should handle different ID formats with type safety", () => {
    const formats: Array<"hex" | "base64"> = ["hex", "base64"];

    formats.forEach(format => {
      const id: SecureId = TypeScriptSecureIdGenerator.generateSecureId({
        length: 16,
        format
      });

      expect(id.format).toBe(format);
      expect(id.value.length).toBeGreaterThan(0);

      if (format === "hex") {
        expect(id.value).toMatch(/^[a-f0-9]+$/);
      } else if (format === "base64") {
        expect(id.value).toMatch(/^[A-Za-z0-9_-]+$/);
      }
    });
  });
});
```

### Rule #16: Concurrency Testing (TypeScript Async/Await + Type Safety)
```typescript
import type { ConcurrentOperation, ConcurrencyTestResult } from "../src/types/concurrency";

class TypeScriptConcurrencyTester {
  static async testConcurrentOperations<T>(
    operations: Array<() => Promise<T>>,
    options: { timeout?: number; retries?: number } = {}
  ): Promise<ConcurrencyTestResult<T>> {
    const { timeout = 5000, retries = 3 } = options;
    const startTime = performance.now();

    try {
      const results = await Promise.allSettled(
        operations.map(op =>
          Promise.race([
            op(),
            new Promise<never>((_, reject) =>
              setTimeout(() => reject(new Error("Timeout")), timeout)
            )
          ])
        )
      );

      const successful = results.filter(r => r.status === "fulfilled").length;
      const failed = results.length - successful;

      return {
        totalOperations: operations.length,
        successful,
        failed,
        duration: performance.now() - startTime,
        results
      };
    } catch (error) {
      throw new Error(`Concurrency test failed: ${error.message}`);
    }
  }
}

describe("TypeScript Concurrency Testing", () => {
  test("should handle concurrent database operations safely", async () => {
    interface UserData {
      id: string;
      name: string;
      email: string;
    }

    // Mock database operations
    const createUser = async (userData: Omit<UserData, "id">): Promise<UserData> => {
      await new Promise(resolve => setTimeout(resolve, Math.random() * 100));
      return {
        id: Math.random().toString(36),
        ...userData
      };
    };

    const operations: Array<() => Promise<UserData>> = [
      () => createUser({ name: "User 1", email: "user1@example.com" }),
      () => createUser({ name: "User 2", email: "user2@example.com" }),
      () => createUser({ name: "User 3", email: "user3@example.com" }),
      () => createUser({ name: "User 4", email: "user4@example.com" }),
      () => createUser({ name: "User 5", email: "user5@example.com" })
    ];

    const result: ConcurrencyTestResult<UserData> = await TypeScriptConcurrencyTester
      .testConcurrentOperations(operations, { timeout: 1000 });

    expect(result.totalOperations).toBe(5);
    expect(result.successful).toBe(5);
    expect(result.failed).toBe(0);
    expect(result.duration).toBeLessThan(1000);
  });

  test("should handle race conditions with typed shared state", async () => {
    interface Counter {
      value: number;
      increment(): Promise<number>;
    }

    class ThreadSafeCounter implements Counter {
      private _value = 0;
      private _lock = false;

      get value(): number {
        return this._value;
      }

      async increment(): Promise<number> {
        // Simple lock mechanism
        while (this._lock) {
          await new Promise(resolve => setTimeout(resolve, 1));
        }

        this._lock = true;
        const current = this._value;
        await new Promise(resolve => setTimeout(resolve, 1)); // Simulate async work
        this._value = current + 1;
        this._lock = false;

        return this._value;
      }
    }

    const counter: Counter = new ThreadSafeCounter();
    const operations: Array<() => Promise<number>> = Array(100)
      .fill(0)
      .map(() => () => counter.increment());

    const result = await TypeScriptConcurrencyTester.testConcurrentOperations(operations);

    expect(result.successful).toBe(100);
    expect(counter.value).toBe(100);
  });

  test("should handle timeout scenarios with typed errors", async () => {
    interface SlowOperation {
      id: string;
      duration: number;
    }

    const slowOperation = async (duration: number): Promise<SlowOperation> => {
      await new Promise(resolve => setTimeout(resolve, duration));
      return {
        id: Math.random().toString(36),
        duration
      };
    };

    const operations: Array<() => Promise<SlowOperation>> = [
      () => slowOperation(100),  // Fast
      () => slowOperation(200),  // Medium
      () => slowOperation(2000), // Too slow - will timeout
      () => slowOperation(50),   // Fast
    ];

    const result = await TypeScriptConcurrencyTester.testConcurrentOperations(
      operations,
      { timeout: 500 }
    );

    expect(result.totalOperations).toBe(4);
    expect(result.successful).toBe(3); // 3 fast operations succeed
    expect(result.failed).toBe(1);     // 1 slow operation times out
  });
});
```

## 🔧 TYPESCRIPT-SPECIFIC OPTIMIZATIONS

### Type Checking Integration
```bash
# Run tests with type checking
npx tsc --noEmit && bun test
npx vitest run --typecheck

# Type coverage analysis
npx type-coverage --detail --strict --at-least 95
```

### Advanced TypeScript Features
```typescript
// Conditional types for testing
type TestResult<T> = T extends string ? StringTest :
                    T extends number ? NumberTest :
                    T extends boolean ? BooleanTest :
                    GenericTest<T>;

// Template literal types for test naming
type TestName<T extends string> = `should_${T}_correctly`;

// Mapped types for comprehensive testing
type TestSuite<T> = {
  [K in keyof T as `test_${string & K}`]: () => void;
};
```

### TypeScript-Aware Mocking
```typescript
import type { UserService } from "../src/services/user";

// Type-safe mocking
const mockUserService: jest.Mocked<UserService> = {
  createUser: jest.fn(),
  findUser: jest.fn(),
  updateUser: jest.fn(),
  deleteUser: jest.fn()
};

// Ensure mock implements interface correctly
const userService: UserService = mockUserService;
```

## 📊 CONFIG
```yaml
typescript_config:
  default_framework: "bun"
  fallback_frameworks: ["vitest", "jest", "mocha"]
  thresholds: { lines: 85, branches: 80, functions: 90, types: 95 }
  performance_targets: { test_execution: "3s/100tests", detection: "40ms" }

  typescript_specific:
    strict_mode: true
    type_checking: true
    type_coverage_threshold: 95

  build_integration:
    pre_test_compile: true
    type_check_on_test: true
    generate_declarations: false
```

---
**Status:** ✅ COMPLETE - TypeScript Adapter | **Frameworks:** Bun, Vitest, Jest, Mocha
**Features:** Type safety, advanced tooling, TypeScript-specific optimizations, type coverage