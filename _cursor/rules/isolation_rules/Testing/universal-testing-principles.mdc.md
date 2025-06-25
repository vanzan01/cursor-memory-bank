---
description: Universal Testing Principles - Language-Agnostic Testing Rules
globs: universal-testing-principles.mdc, testing/*.mdc, **/test-*.mdc
alwaysApply: true
---

# UNIVERSAL TESTING PRINCIPLES

> **TL;DR:** Language-agnostic testing principles extracted from Memory Bank Rules #8-16. These principles work across JavaScript, Python, Java, C#, Go, Rust, and any other programming language by focusing on universal testing patterns rather than language-specific implementations.

## 🌍 LANGUAGE SUPPORT

**Supported Languages:**
- JavaScript (Node.js, Bun, Deno)
- TypeScript (Node.js, Bun, Deno with type checking)
- Python (CPython, PyPy)
- Java (OpenJDK, Oracle JDK)
- C# (.NET Core, .NET Framework)
- Go (Official Go compiler)
- Rust (rustc)
- Zig (0.11+, 0.12+)

**Supported Testing Frameworks:** 22+
- **JavaScript:** Jest, Vitest, Bun Test, Mocha, Jasmine
- **TypeScript:** Bun Test, Vitest, Jest, Mocha (with type checking)
- **Python:** pytest, unittest, nose2, doctest
- **Java:** JUnit 5, TestNG, Spock
- **C#:** xUnit, NUnit, MSTest
- **Go:** testing package, Ginkgo, Testify
- **Rust:** built-in test framework, criterion
- **Zig:** built-in test framework, zBench

## 🎯 CORE UNIVERSAL PRINCIPLES

### Principle #1: Universal Test Structure (Rule #8)
**Pattern:** Arrange-Act-Assert (AAA) / Given-When-Then (GWT)

```yaml
universal_rule_8_granular_tests:
  principle: "Each function/method/module must have dedicated, granular tests"
  pattern: "Arrange-Act-Assert or Given-When-Then"

  implementations:
    javascript: "describe('function', () => { test('behavior', () => { /* AAA */ }) })"
    typescript: "test('should behave correctly', () => { /* AAA with types */ })"
    python: "def test_function_behavior(): # AAA pattern"
    java: "@Test void testFunctionBehavior() { /* AAA */ }"
    csharp: "[Test] public void TestFunctionBehavior() { /* AAA */ }"
    go: "func TestFunctionBehavior(t *testing.T) { /* AAA */ }"
    rust: "#[test] fn test_function_behavior() { /* AAA */ }"
    zig: "test \"should behave correctly\" { /* AAA pattern */ }"

  verification:
    command_pattern: "[language_adapter].run_granular_tests()"
    success_criteria: "All functions have dedicated test cases"
    coverage_target: "≥90% function coverage"
```

### Principle #2: Universal Test Isolation (Rule #9)
**Pattern:** Clean Setup/Teardown with State Independence

```yaml
universal_rule_9_test_isolation:
  principle: "Complete test isolation with clean setup/teardown"
  pattern: "Each test runs in isolated environment"

  implementations:
    javascript: "beforeEach/afterEach hooks with cleanup"
    typescript: "beforeEach/afterEach with typed cleanup functions"
    python: "pytest fixtures with setup/teardown or unittest setUp/tearDown"
    java: "@BeforeEach/@AfterEach annotations"
    csharp: "[SetUp]/[TearDown] attributes"
    go: "TestMain with setup/teardown or per-test cleanup"
    rust: "test fixtures with Drop trait for cleanup"
    zig: "defer statements for automatic cleanup and ArenaAllocator"

  verification:
    command_pattern: "[language_adapter].ensure_test_isolation()"
    success_criteria: "Tests pass in any order, no shared state"
    isolation_check: "Randomize test execution order"
```

### Principle #3: Universal Feature Completeness (Rule #10)
**Pattern:** Feature-Driven Test Development

```yaml
universal_rule_10_feature_testing:
  principle: "No feature is complete without comprehensive tests"
  pattern: "Feature → Tests → Implementation validation"

  test_types:
    unit: "Individual component testing"
    integration: "Component interaction testing"
    e2e: "End-to-end workflow testing"
    acceptance: "Business requirement validation"

  implementations:
    javascript: "Feature test suites with unit/integration/e2e layers"
    python: "pytest with markers for test types (unit, integration, e2e)"
    java: "JUnit 5 with @Tag annotations for test categorization"
    csharp: "xUnit with [Trait] attributes for test classification"
    go: "build tags for test categorization (unit, integration)"
    rust: "cfg attributes for conditional test compilation"

  verification:
    command_pattern: "[language_adapter].validate_feature_coverage()"
    success_criteria: "Each feature has unit + integration + e2e tests"
    coverage_matrix: "Feature × Test Type coverage table"
```

### Principle #4: Universal Coverage Monitoring (Rule #11)
**Pattern:** Continuous Coverage Measurement

```yaml
universal_rule_11_coverage_monitoring:
  principle: "Continuous coverage monitoring with threshold enforcement"
  pattern: "Measure → Report → Enforce → Improve"

  metrics:
    line_coverage: "≥90% lines executed"
    branch_coverage: "≥85% branches tested"
    function_coverage: "≥95% functions called"
    statement_coverage: "≥90% statements executed"

  implementations:
    javascript: "c8, nyc, or built-in coverage (Bun/Vitest)"
    python: "coverage.py with pytest-cov plugin"
    java: "JaCoCo coverage plugin"
    csharp: "coverlet or dotCover coverage tools"
    go: "go test -cover with coverage profiles"
    rust: "cargo-tarpaulin or grcov for coverage"

  verification:
    command_pattern: "[language_adapter].generate_coverage_report()"
    success_criteria: "Coverage thresholds met, reports generated"
    enforcement: "CI/CD pipeline fails below threshold"
```

### Principle #5: Universal Edge Case Testing (Rule #12)
**Pattern:** Boundary Value Analysis + Error Condition Testing

```yaml
universal_rule_12_edge_case_testing:
  principle: "Comprehensive boundary and error condition testing"
  pattern: "Normal + Boundary + Error conditions"

  edge_case_categories:
    boundary_values: "Min/max values, empty/null inputs"
    error_conditions: "Invalid inputs, network failures, timeouts"
    resource_limits: "Memory limits, file system errors"
    concurrency_issues: "Race conditions, deadlocks"

  implementations:
    javascript: "Property-based testing with fast-check"
    python: "Hypothesis for property-based testing"
    java: "jqwik for property-based testing"
    csharp: "FsCheck.NET for property-based testing"
    go: "testing/quick package for property-based testing"
    rust: "proptest crate for property-based testing"

  verification:
    command_pattern: "[language_adapter].test_edge_cases()"
    success_criteria: "All boundary conditions and error paths tested"
    automation: "Property-based test generation where possible"
```

### Principle #6: Universal Performance Testing (Rule #13)
**Pattern:** Performance Benchmarking + Regression Detection

```yaml
universal_rule_13_performance_testing:
  principle: "Performance benchmarks and regression testing"
  pattern: "Baseline → Measure → Compare → Alert"

  performance_metrics:
    execution_time: "Function/method execution duration"
    memory_usage: "Memory allocation and peak usage"
    throughput: "Operations per second"
    latency: "Response time percentiles (p50, p95, p99)"

  implementations:
    javascript: "Benchmark.js or built-in performance APIs"
    python: "pytest-benchmark or timeit module"
    java: "JMH (Java Microbenchmark Harness)"
    csharp: "BenchmarkDotNet framework"
    go: "testing.B benchmark functions"
    rust: "criterion.rs benchmarking framework"

  verification:
    command_pattern: "[language_adapter].run_performance_tests()"
    success_criteria: "Performance within acceptable bounds"
    regression_detection: "Alert on >10% performance degradation"
```

### Principle #7: Universal Timing Precision (Rule #14)
**Pattern:** High-Resolution Time Measurement

```yaml
universal_rule_14_precise_timing:
  principle: "Precise timing measurements for performance validation"
  pattern: "High-resolution timestamps for accurate measurement"

  timing_sources:
    javascript: "performance.now() for microsecond precision"
    python: "time.perf_counter() for monotonic timing"
    java: "System.nanoTime() for nanosecond precision"
    csharp: "Stopwatch.GetTimestamp() for high precision"
    go: "time.Now() with nanosecond precision"
    rust: "std::time::Instant for monotonic timing"

  implementations:
    measurement_pattern: "Start → Execute → Stop → Calculate"
    statistical_analysis: "Multiple runs with mean/median/percentiles"
    warmup_handling: "JIT warmup for accurate measurements"

  verification:
    command_pattern: "[language_adapter].measure_performance()"
    success_criteria: "Consistent timing measurements"
    precision_target: "Microsecond-level precision where possible"
```

### Principle #8: Universal Secure ID Testing (Rule #15)
**Pattern:** Cryptographic Security Validation

```yaml
universal_rule_15_secure_id_generation:
  principle: "Cryptographically secure ID generation testing"
  pattern: "Generate → Analyze → Validate entropy/uniqueness"

  security_requirements:
    entropy: "Sufficient randomness for security"
    uniqueness: "No collisions in reasonable sample size"
    unpredictability: "Cannot predict next ID from previous ones"
    format_compliance: "Meets specified format requirements"

  implementations:
    javascript: "crypto.randomUUID() or crypto.getRandomValues()"
    python: "secrets module or uuid.uuid4()"
    java: "SecureRandom class with proper algorithms"
    csharp: "RNGCryptoServiceProvider or Guid.NewGuid()"
    go: "crypto/rand package for secure randomness"
    rust: "rand crate with OsRng for cryptographic randomness"

  verification:
    command_pattern: "[language_adapter].test_id_generation()"
    success_criteria: "IDs pass entropy and uniqueness tests"
    statistical_tests: "Chi-square test for randomness"
```

### Principle #9: Universal Concurrency Testing (Rule #16)
**Pattern:** Race Condition + Deadlock Detection

```yaml
universal_rule_16_concurrency_testing:
  principle: "Concurrency and race condition testing"
  pattern: "Concurrent execution → Race detection → Deadlock prevention"

  concurrency_scenarios:
    race_conditions: "Multiple threads accessing shared resources"
    deadlocks: "Circular dependency detection"
    resource_contention: "Limited resource access patterns"
    async_operations: "Promise/Future/async-await testing"

  implementations:
    javascript: "Worker threads, Promise.all, async/await testing"
    python: "threading, asyncio, multiprocessing testing"
    java: "ExecutorService, CompletableFuture, parallel streams"
    csharp: "Task.Run, Parallel.ForEach, async/await testing"
    go: "goroutines, channels, sync package testing"
    rust: "tokio runtime, rayon, std::thread testing"

  verification:
    command_pattern: "[language_adapter].test_concurrency()"
    success_criteria: "No race conditions or deadlocks detected"
    stress_testing: "High-concurrency load testing"
```

## 🔧 UNIVERSAL IMPLEMENTATION INTERFACE

### Language Adapter Interface

```yaml
language_adapter_interface:
  required_methods:
    detect_language(): "Detect primary language and version"
    detect_frameworks(): "Detect available testing frameworks"
    run_granular_tests(): "Execute Rule #8 implementation"
    ensure_test_isolation(): "Execute Rule #9 implementation"
    validate_feature_coverage(): "Execute Rule #10 implementation"
    generate_coverage_report(): "Execute Rule #11 implementation"
    test_edge_cases(): "Execute Rule #12 implementation"
    run_performance_tests(): "Execute Rule #13 implementation"
    measure_performance(): "Execute Rule #14 implementation"
    test_id_generation(): "Execute Rule #15 implementation"
    test_concurrency(): "Execute Rule #16 implementation"

  configuration:
    language_config: "Language-specific settings"
    framework_config: "Framework-specific settings"
    rule_overrides: "Custom rule implementations"
```

## 📊 SUCCESS METRICS

### Universal Compatibility
- **Language Coverage:** 8+ languages supported
- **Framework Coverage:** 22+ testing frameworks
- **Rule Coverage:** 100% of Rules #8-16 implemented
- **Cross-Platform:** Windows, macOS, Linux support

### Performance Standards
- **Detection Time:** <200ms for language/framework detection
- **Execution Overhead:** <10% compared to native implementations
- **Memory Usage:** <50MB additional memory footprint
- **Startup Time:** <500ms for universal controller initialization

### Quality Assurance
- **Backward Compatibility:** 100% with existing Bun-based tests
- **Integration Success:** All Memory Bank modes work seamlessly
- **Error Handling:** Graceful degradation for unsupported scenarios
- **Documentation:** Complete API documentation and examples

---

**Status:** ✅ COMPLETE - Universal Principles Defined
**Next Phase:** Language Adapter Implementation
**Confidence Level:** High (98%)