---
description: JavaScript/TypeScript Language Adapter for Universal Testing
globs: javascript-adapter.mdc, js-testing.mdc, **/js-test-*.mdc
alwaysApply: false
---

# JAVASCRIPT/TYPESCRIPT LANGUAGE ADAPTER

> **TL;DR:** Language adapter for JavaScript/TypeScript projects supporting Bun, Jest, Vitest, Mocha, and other popular testing frameworks. Implements all universal testing principles with JavaScript-specific optimizations.

## 🎯 SUPPORTED ENVIRONMENTS

**Runtimes:**
- **Bun** (Primary) - Ultra-fast runtime with built-in testing
- **Node.js** - Traditional JavaScript runtime
- **Deno** - Secure TypeScript runtime
- **Browser** - Client-side testing environments

**Testing Frameworks:**
- **Bun Test** (Primary) - Built-in, fast, TypeScript-native
- **Jest** - Popular, feature-rich testing framework
- **Vitest** - Vite-native, fast, ESM-first
- **Mocha** - Flexible, minimal testing framework
- **Jasmine** - Behavior-driven testing framework

## 🔍 LANGUAGE DETECTION

```yaml
javascript_detection:
  primary_indicators:
    - "package.json exists"
    - "*.js, *.ts, *.jsx, *.tsx files present"
    - "node_modules directory exists"

  runtime_detection:
    bun: "bun.lockb exists OR 'bun' in package.json scripts"
    nodejs: "package-lock.json OR yarn.lock exists"
    deno: "deno.json OR deno.jsonc exists"

  framework_detection:
    bun_test: "bun in devDependencies OR bun test command"
    jest: "'jest' in devDependencies"
    vitest: "'vitest' in devDependencies"
    mocha: "'mocha' in devDependencies"
    jasmine: "'jasmine' in devDependencies"
```

## 🎯 UNIVERSAL RULE IMPLEMENTATIONS

### Rule #8: Granular Tests
```yaml
rule_8_granular_tests:
  pattern: "describe/test blocks with AAA pattern"

  bun_implementation: |
    import { describe, test, expect, beforeEach, afterEach } from "bun:test";

    describe("ComponentName", () => {
      test("should behave correctly when given valid input", () => {
        // Arrange
        const input = "valid input";
        const expected = "expected output";

        // Act
        const result = functionUnderTest(input);

        // Assert
        expect(result).toBe(expected);
      });
    });

  jest_implementation: |
    describe("ComponentName", () => {
      test("should behave correctly when given valid input", () => {
        // Arrange
        const input = "valid input";
        const expected = "expected output";

        // Act
        const result = functionUnderTest(input);

        // Assert
        expect(result).toBe(expected);
      });
    });

  commands:
    bun: "bun test --reporter=verbose"
    jest: "jest --verbose"
    vitest: "vitest --reporter=verbose"
    mocha: "mocha --reporter=spec"
```

### Rule #9: Test Isolation
```yaml
rule_9_test_isolation:
  pattern: "beforeEach/afterEach hooks with cleanup"

  implementation: |
    describe("IsolatedComponent", () => {
      let testData;
      let mockServices;

      beforeEach(() => {
        // Arrange: Clean setup for each test
        testData = createTestData();
        mockServices = createMockServices();
        jest.clearAllMocks(); // Clear mock history
      });

      afterEach(() => {
        // Cleanup: Reset state after each test
        testData = null;
        mockServices = null;
        jest.restoreAllMocks();
      });

      test("test runs in isolation", () => {
        // Test implementation
      });
    });

  verification_command: "bun test --random-order"
  isolation_check: "Tests pass when run in random order"
```

### Rule #10: Feature Testing
```yaml
rule_10_feature_testing:
  pattern: "Feature test suites with layered testing"

  structure: |
    src/
      components/
        UserProfile/
          UserProfile.ts
          UserProfile.unit.test.ts      # Unit tests
          UserProfile.integration.test.ts # Integration tests
          UserProfile.e2e.test.ts       # End-to-end tests

  implementation: |
    // UserProfile.unit.test.ts
    describe("UserProfile Unit Tests", () => {
      test("renders user name correctly", () => { /* unit test */ });
    });

    // UserProfile.integration.test.ts
    describe("UserProfile Integration Tests", () => {
      test("integrates with UserService", () => { /* integration test */ });
    });

    // UserProfile.e2e.test.ts
    describe("UserProfile E2E Tests", () => {
      test("complete user profile workflow", () => { /* e2e test */ });
    });

  commands:
    unit: "bun test --testNamePattern='Unit Tests'"
    integration: "bun test --testNamePattern='Integration Tests'"
    e2e: "bun test --testNamePattern='E2E Tests'"
    all: "bun test"
```

### Rule #11: Coverage Monitoring
```yaml
rule_11_coverage_monitoring:
  tools:
    bun: "Built-in coverage with --coverage flag"
    jest: "Built-in coverage with --coverage flag"
    vitest: "Built-in coverage with --coverage flag"
    c8: "Universal coverage tool for Node.js"

  configuration: |
    // package.json
    {
      "scripts": {
        "test": "bun test",
        "test:coverage": "bun test --coverage",
        "test:coverage-threshold": "bun test --coverage --coverage-threshold=90"
      }
    }

  thresholds:
    lines: 90
    branches: 85
    functions: 95
    statements: 90

  commands:
    generate: "bun test --coverage --coverage-reporter=html"
    enforce: "bun test --coverage --coverage-threshold=90"
    report: "bun test --coverage --coverage-reporter=text-summary"
```

### Rule #12: Edge Case Testing
```yaml
rule_12_edge_case_testing:
  approach: "Property-based testing with fast-check"

  implementation: |
    import fc from "fast-check";

    describe("Edge Case Testing", () => {
      test("handles all possible string inputs", () => {
        fc.assert(fc.property(fc.string(), (input) => {
          const result = processString(input);
          expect(typeof result).toBe("string");
          expect(result.length).toBeGreaterThanOrEqual(0);
        }));
      });

      test("handles boundary values", () => {
        const boundaryValues = [null, undefined, "", 0, -1, Number.MAX_SAFE_INTEGER];
        boundaryValues.forEach(value => {
          expect(() => processValue(value)).not.toThrow();
        });
      });
    });

  commands:
    property_based: "bun test --testNamePattern='property'"
    boundary: "bun test --testNamePattern='boundary'"
```

### Rule #13: Performance Testing
```yaml
rule_13_performance_testing:
  tools:
    bun: "Built-in Bun.bench() function"
    benchmark_js: "Popular benchmarking library"
    performance_api: "Browser/Node.js performance API"

  implementation: |
    import { bench, group, run } from "mitata";

    group("Performance Tests", () => {
      bench("fast operation", () => {
        return fastOperation();
      });

      bench("optimized operation", () => {
        return optimizedOperation();
      });
    });

    await run();

  bun_bench_example: |
    import { bench } from "bun:test";

    bench("array processing", () => {
      const arr = Array.from({ length: 1000 }, (_, i) => i);
      return arr.map(x => x * 2).filter(x => x > 500);
    });

  commands:
    run_benchmarks: "bun test --bench"
    performance_profile: "bun test --bench --verbose"
```

### Rule #14: Precise Timing
```yaml
rule_14_precise_timing:
  timing_source: "performance.now() for microsecond precision"

  implementation: |
    function measurePerformance<T>(fn: () => T): { result: T; duration: number } {
      const start = performance.now();
      const result = fn();
      const end = performance.now();

      return {
        result,
        duration: end - start // Duration in milliseconds with microsecond precision
      };
    }

    test("precise timing measurement", () => {
      const { result, duration } = measurePerformance(() => {
        return expensiveOperation();
      });

      expect(result).toBeDefined();
      expect(duration).toBeGreaterThan(0);
      expect(duration).toBeLessThan(1000); // Should complete within 1 second
    });

  statistical_analysis: |
    function runMultipleTimes<T>(fn: () => T, iterations: number = 100) {
      const measurements = [];

      for (let i = 0; i < iterations; i++) {
        const { duration } = measurePerformance(fn);
        measurements.push(duration);
      }

      return {
        mean: measurements.reduce((a, b) => a + b) / measurements.length,
        median: measurements.sort()[Math.floor(measurements.length / 2)],
        min: Math.min(...measurements),
        max: Math.max(...measurements)
      };
    }
```

### Rule #15: Secure ID Testing
```yaml
rule_15_secure_id_generation:
  crypto_source: "crypto.randomUUID() and crypto.getRandomValues()"

  implementation: |
    import { randomUUID, getRandomValues } from "crypto";

    describe("Secure ID Generation", () => {
      test("generates cryptographically secure UUIDs", () => {
        const ids = new Set();
        const iterations = 10000;

        for (let i = 0; i < iterations; i++) {
          const id = randomUUID();
          expect(id).toMatch(/^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/);
          expect(ids.has(id)).toBe(false); // No collisions
          ids.add(id);
        }
      });

      test("generates secure random values", () => {
        const buffer = new Uint8Array(32);
        getRandomValues(buffer);

        // Test entropy - no repeated patterns
        const uniqueValues = new Set(buffer);
        expect(uniqueValues.size).toBeGreaterThan(20); // High entropy
      });
    });
```

### Rule #16: Concurrency Testing
```yaml
rule_16_concurrency_testing:
  approach: "Promise.all, Worker threads, async/await testing"

  implementation: |
    describe("Concurrency Testing", () => {
      test("handles concurrent async operations", async () => {
        const promises = Array.from({ length: 100 }, () =>
          asyncOperation()
        );

        const results = await Promise.all(promises);

        expect(results).toHaveLength(100);
        results.forEach(result => {
          expect(result).toBeDefined();
        });
      });

      test("detects race conditions", async () => {
        let sharedResource = 0;
        const incrementResource = async () => {
          const current = sharedResource;
          await new Promise(resolve => setTimeout(resolve, 1));
          sharedResource = current + 1;
        };

        const promises = Array.from({ length: 10 }, incrementResource);
        await Promise.all(promises);

        // This test should fail if there are race conditions
        expect(sharedResource).toBe(10);
      });

      test("worker thread communication", async () => {
        const { Worker, isMainThread, parentPort, workerData } = await import("worker_threads");

        if (isMainThread) {
          const worker = new Worker(__filename, {
            workerData: { value: 42 }
          });

          const result = await new Promise((resolve) => {
            worker.on("message", resolve);
          });

          expect(result).toBe(84); // 42 * 2
          await worker.terminate();
        } else {
          parentPort?.postMessage(workerData.value * 2);
        }
      });
    });
```

## 🔧 ADAPTER INTERFACE IMPLEMENTATION

```typescript
interface JavaScriptAdapter extends LanguageAdapter {
  // Detection methods
  detectLanguage(): Promise<LanguageInfo>;
  detectFrameworks(): Promise<TestingFramework[]>;

  // Universal rule implementations
  runGranularTests(options?: TestOptions): Promise<TestResult>;
  ensureTestIsolation(): Promise<IsolationResult>;
  validateFeatureCoverage(): Promise<CoverageMatrix>;
  generateCoverageReport(): Promise<CoverageReport>;
  testEdgeCases(): Promise<EdgeCaseResult>;
  runPerformanceTests(): Promise<PerformanceResult>;
  measurePerformance<T>(fn: () => T): Promise<TimingResult<T>>;
  testIdGeneration(): Promise<SecurityTestResult>;
  testConcurrency(): Promise<ConcurrencyTestResult>;

  // JavaScript-specific methods
  setupBunEnvironment(): Promise<void>;
  configureJest(): Promise<void>;
  setupVitest(): Promise<void>;
}
```

## 📊 CONFIGURATION

```yaml
javascript_config:
  default_framework: "bun"
  fallback_frameworks: ["jest", "vitest", "mocha"]

  framework_priorities:
    - name: "bun"
      score: 100
      indicators: ["bun.lockb", "bun in package.json"]
    - name: "vitest"
      score: 90
      indicators: ["vitest in devDependencies", "vite.config.*"]
    - name: "jest"
      score: 80
      indicators: ["jest in devDependencies", "jest.config.*"]

  performance_targets:
    test_execution: "< 5 seconds for 100 tests"
    coverage_generation: "< 10 seconds"
    framework_detection: "< 100ms"

  rule_overrides:
    rule_8_coverage_target: 95  # Higher for JavaScript
    rule_11_thresholds:
      lines: 90
      branches: 85
      functions: 95
```

---

**Status:** ✅ COMPLETE - JavaScript Adapter Implemented
**Framework Support:** Bun, Jest, Vitest, Mocha, Jasmine
**Rule Coverage:** 100% (Rules #8-16)
**Performance:** Optimized for Bun runtime