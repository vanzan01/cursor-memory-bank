# Development Workflow Rules

## Core Principles

### Documentation and Tracking
- **Record all thoughts and ideas** that need verification in the current working file
- **Mark successful ideas** with ✅ and **failed ideas** with ❌
- **Never delete ideas** to avoid revisiting them in future sessions
- **Document progress** after each successful stage and move to the next step

### Testing Strategy with Bun
- **Use Bun's built-in test runner** for fast, Jest-compatible testing
- **Leverage TypeScript and JSX support** without additional configuration
- **Verify new successful ideas don't break existing tests**
- **Ensure tests use actual implementations**, not stubs/mocks
- **If stubs are used temporarily** for implementation progress, remember to replace them with real functionality
- **Create high-granularity tests** and group them by functionality using `describe` blocks
- **Consider test dependencies** - don't break one test while fixing another
- **Ensure test context isolation** - clean up context between tests to prevent interference
- **Create tests for every feature** - no feature should be implemented without corresponding tests
- **Verify functional coverage** at the end of each step/phase to ensure all planned functionality is tested
- **Use high-precision timing** - prefer `performance.now()` over `Date.now()` for performance measurements and time-sensitive operations
- **Implement collision-resistant ID generation** - avoid time-based IDs that can collide under high load; use counters, UUIDs, or hybrid approaches
- **Use Bun's fast test execution** for rapid feedback during development
- **Leverage snapshot testing** for complex data structures and UI components
- **Use test.each for parametrized testing** when testing multiple similar scenarios

### Bun Test Features Integration
- **Use lifecycle hooks** (`beforeAll`, `beforeEach`, `afterEach`, `afterAll`) for proper test setup and cleanup
- **Leverage mock functions** with `mock()` or `jest.fn()` for dependency isolation
- **Use spyOn()** for tracking function calls without replacing implementation
- **Apply conditional testing** with `test.if()`, `test.skipIf()`, `test.todoIf()` for platform-specific tests
- **Use test.only()** for focused debugging of specific tests
- **Use test.failing()** for tracking known bugs that should be fixed
- **Implement assertion counting** with `expect.assertions()` and `expect.hasAssertions()` for async tests
- **Use test.each()** for data-driven testing scenarios
- **Leverage module mocking** with `mock.module()` for integration testing

### Debugging Methodology
- **Before debugging complex tests**, perform manual tracing with expected results
- **Mark the step where errors occur** and save the trace log in a separate markdown file
- **Only then proceed** to debugging and fixing
- **Build dependency maps** based on failing tests during current test debugging
- **Track test execution sequence** to avoid breaking other tests
- **Use Bun's detailed error reporting** for faster issue identification
- **Leverage test filtering** with `--test-name-pattern` for focused debugging
- **For large test suites**, redirect output to file and analyze with grep:
  - `bun test > test_output.log 2>&1` - capture all output
  - `grep "(fail)" test_output.log` - find failing tests
  - `bun test -t "specific-test-pattern"` - run individual failing tests
  - `grep -A 5 -B 5 "error_pattern" test_output.log` - context around errors

### Integration Planning
- **Design phases/steps/stages in isolation** when possible for better modularity
- **Plan integration steps explicitly** for combining developed components
- **Include integration phases** in project planning with dedicated time allocation
- **Test integration points** separately from individual component functionality
- **Document integration dependencies** and potential conflict points
- **Use module mocking** to test integration boundaries independently

### Implementation Flow
1. Document current thoughts and verification needs
2. Mark ideas as successful ✅ or failed ❌
3. Verify new changes don't break existing functionality using `bun test`
4. Check tests use real implementations, not stubs
5. Fix any temporary stubs with actual functionality
6. **Ensure test context is properly cleaned between tests** using lifecycle hooks
7. **Create comprehensive tests for each new feature** with appropriate matchers
8. **Verify functional coverage matches step/phase requirements** using Bun's coverage tools
9. Document successful stage completion
10. **Plan and execute integration steps for isolated components**
11. For complex debugging: trace manually → log → debug → fix
12. Create granular tests grouped by functionality using `describe` blocks
13. Build test dependency maps to prevent regressions
14. **Use Bun's watch mode** (`--watch`) for continuous testing during development
15. **For large test analysis**: `bun test > test_output.log 2>&1` → `grep "(fail)" | cut -d'>' -f1 | sort | uniq` → `bun test -t "Group Name"`

### Quality Assurance
- Always run full test suite after changes with `bun test`
- Maintain test independence where possible using proper cleanup
- **Implement proper test cleanup and context isolation** with lifecycle hooks
- Document test dependencies when they exist
- Preserve working functionality while adding new features
- Keep detailed logs of debugging sessions for future reference
- **Validate that all planned functionality for each phase is covered by tests**
- **Test integration points between isolated components**
- **Use Bun's performance testing capabilities** for load and stress testing
- **Leverage Bun's CI/CD integration** for automated testing in pipelines

### Performance and Reliability Considerations
- **Time Precision:** Use `performance.now()` for accurate timing measurements, especially in performance tests
- **ID Generation:** Implement collision-resistant ID generation strategies for high-throughput scenarios
- **Load Testing:** Design tests that can handle multiple operations within the same millisecond
- **Concurrency Safety:** Ensure ID generators and timing mechanisms work correctly under concurrent access
- **Memory Management:** Use Bun's efficient runtime for better memory usage in tests
- **Test Execution Speed:** Leverage Bun's fast test runner for rapid iteration

### Bun-Specific Best Practices
- **Use bunfig.toml** for test configuration and preload scripts
- **Leverage preload scripts** for test setup and mocking that needs to happen before imports
- **Use Bun's module resolution** for cleaner test imports
- **Take advantage of Bun's TypeScript support** for type-safe testing
- **Use Bun's built-in matchers** for comprehensive assertions
- **Leverage Bun's snapshot testing** for complex object comparisons
- **Use Bun's timeout handling** for async test management
- **Apply Bun's test filtering** for efficient test execution during development

## File Organization
- Use dedicated markdown files for debugging traces
- Maintain progress documentation in implementation files
- Keep dependency maps updated as tests evolve
- Preserve failed attempt documentation for learning
- **Document integration plans and test coverage reports**
- **Use bunfig.toml** for centralized test configuration
- **Organize test files** following Bun's discovery patterns (`*.test.ts`, `*.spec.ts`)

### Test File Structure
```
src/
  feature/
    core.ts
    core.test.ts          # Unit tests
    core.integration.ts   # Integration tests
    core.performance.ts   # Performance tests
  __tests__/
    setup.ts             # Test setup and utilities
    mocks/               # Shared mocks
    fixtures/            # Test data
```

### Configuration Management
```toml
# bunfig.toml
[test]
preload = ["./src/__tests__/setup.ts"]
timeout = 10000
coverage = true
```

### Large Test Suite Analysis
```bash
# Capture full test output
bun test > test_output.log 2>&1

# Find all failing tests
grep "(fail)" test_output.log

# Extract unique test groups for systematic analysis
grep "(fail)" test_output.log | cut -d'>' -f1 | sort | uniq

# Example output:
# Replication Network Layer
# Automated Optimization Integration
# Phase 5.3 Day 1
# NetworkDetector with Mocks

# Run tests by group (faster than individual tests)
bun test -t "Replication Network Layer"
bun test -t "Automated Optimization Integration"
bun test -t "Phase 5.3 Day 1"
bun test -t "NetworkDetector with Mocks"

# Run specific subgroups if needed
bun test -t "Replication Network Layer > Connection Management"
bun test -t "Automated Optimization Integration > Error Handling"

# Find specific error patterns
grep -i "error\|exception\|timeout" test_output.log

# Get context around failures
grep -A 10 -B 5 "(fail)" test_output.log

# Analyze test timing by group
grep -E "✓|✗" test_output.log | grep -E "\([0-9]+ms\)" | sort -t'[' -k2 -nr
```