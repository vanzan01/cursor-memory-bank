# Development Prompt Rules

## Quick Reference for AI Assistant

### Documentation Protocol
- Record all ideas in working file with ✅/❌ markers
- Never delete ideas (avoid revisiting failed approaches)
- Document progress after each successful stage

### Testing Protocol with Bun
- **Use `bun test` command** for all test execution
- **Leverage Bun's Jest compatibility** for familiar testing patterns
- **Use TypeScript/JSX support** without additional configuration
- Verify new changes don't break existing tests
- Replace stubs with real implementations
- Create granular tests grouped by functionality using `describe` blocks
- Map test dependencies to prevent regressions
- **Ensure test context cleanup between tests** using lifecycle hooks
- **Create tests for every new feature** with appropriate Bun matchers
- **Verify functional coverage at end of each step/phase**
- **Use performance.now() for timing measurements**
- **Implement collision-resistant ID generation**
- **Use Bun's watch mode** (`--watch`) for continuous development
- **Leverage snapshot testing** for complex data validation
- **Use test.each()** for parametrized testing scenarios

### Bun Test Features to Utilize
- **Lifecycle hooks:** `beforeAll`, `beforeEach`, `afterEach`, `afterAll`
- **Mocking:** `mock()`, `jest.fn()`, `spyOn()`, `mock.module()`
- **Conditional tests:** `test.if()`, `test.skipIf()`, `test.todoIf()`
- **Focused testing:** `test.only()`, `describe.only()`
- **Known failures:** `test.failing()` for tracking bugs
- **Async validation:** `expect.assertions()`, `expect.hasAssertions()`
- **Data-driven tests:** `test.each()`, `describe.each()`
- **Module mocking:** `mock.module()` for integration boundaries
- **Snapshot testing:** `toMatchSnapshot()`, `toMatchInlineSnapshot()`

### Integration Protocol
- **Design phases/steps in isolation when possible**
- **Plan explicit integration steps for combining components**
- **Include integration phases in project timeline**
- **Test integration points separately from individual components**
- **Use module mocking** to test boundaries independently

### Debugging Protocol with Bun
1. Manual trace with expected results first
2. Log trace in separate markdown file
3. Mark error step location
4. **Use Bun's detailed error reporting** for faster diagnosis
5. **Leverage test filtering** (`--test-name-pattern`) for focused debugging
6. **For large test suites**: capture output and analyze systematically
   - `bun test > test_output.log 2>&1` - capture all output
   - `grep "(fail)" test_output.log` - identify failing tests
   - **Group analysis**: identify test groups from failure patterns
   - `bun test -t "Group Name"` - run entire test groups
   - `bun test -t "Group Name > Subgroup"` - run specific subgroups
7. Then debug and fix
8. Build dependency maps from failing tests

### Group-Based Test Analysis
```bash
# Step 1: Capture and identify failing test groups
bun test > test_output.log 2>&1
grep "(fail)" test_output.log

# Step 2: Extract unique test groups
grep "(fail)" test_output.log | cut -d'>' -f1 | sort | uniq

# Step 3: Run tests by group
bun test -t "Replication Network Layer"
bun test -t "Automated Optimization Integration"
bun test -t "Phase 5.3 Day 1"
bun test -t "NetworkDetector with Mocks"

# Step 4: Run specific subgroups if needed
bun test -t "Replication Network Layer > Connection Management"
bun test -t "Automated Optimization Integration > Error Handling"
```

### Implementation Checklist
- [ ] Document current thoughts/verification needs
- [ ] Mark ideas as ✅ successful or ❌ failed
- [ ] Verify no existing test breakage with `bun test`
- [ ] Check tests use real implementations (not stubs)
- [ ] Replace any temporary stubs
- [ ] **Ensure test context isolation and cleanup** with lifecycle hooks
- [ ] **Create comprehensive tests for new features** using Bun matchers
- [ ] **Verify functional coverage matches phase requirements**
- [ ] Document stage completion
- [ ] **Plan and execute integration steps for isolated components**
- [ ] For complex bugs: trace → log → debug → fix
- [ ] Create granular tests by functionality using `describe` blocks
- [ ] Update test dependency maps
- [ ] **Use Bun's watch mode** for rapid iteration
- [ ] **Analyze test failures by groups** using `grep "(fail)" | cut -d'>' -f1 | sort | uniq`
- [ ] **Run tests by groups** using `bun test -t "Group Name"`

### Quality Gates with Bun
- Run full test suite after changes: `bun test`
- Maintain test independence where possible
- **Implement proper test cleanup and context isolation** with hooks
- Document test dependencies when they exist
- Preserve working functionality during development
- **Validate test coverage for all planned functionality**
- **Test integration points between components**
- **Use Bun's performance testing** for load validation
- **Leverage Bun's CI/CD integration** for automated pipelines

### Performance Protocol
- **Use `performance.now()` instead of `Date.now()` for timing**
- **Design ID generators to handle high-load scenarios**
- **Test for timing collisions in concurrent operations**
- **Validate ID uniqueness under load**
- **Leverage Bun's fast test execution** for rapid feedback
- **Use Bun's efficient runtime** for better memory usage

### Bun-Specific Commands and Patterns
```bash
# Basic test execution
bun test

# Watch mode for development
bun test --watch

# Filter tests by name pattern
bun test --test-name-pattern "integration"

# Run specific test file
bun test ./src/feature.test.ts

# Update snapshots
bun test --update-snapshots

# Coverage reporting
bun test --coverage

# Timeout configuration
bun test --timeout 10000

# Bail on failures
bun test --bail

# Rerun tests multiple times
bun test --rerun-each 5

# Large test suite analysis with grouping
bun test > test_output.log 2>&1
grep "(fail)" test_output.log
grep "(fail)" test_output.log | cut -d'>' -f1 | sort | uniq  # Extract groups
bun test -t "Group Name"                                     # Run by group
bun test -t "Group Name > Subgroup"                         # Run subgroup
```

### Test Organization Patterns
```typescript
// Use describe blocks for grouping
describe('Feature Name', () => {
  describe('when condition A', () => {
    beforeEach(() => {
      // Setup for this group
    })

    it('should behave correctly', () => {
      // Test implementation
    })
  })
})

// Use test.each for data-driven tests
test.each([
  [input1, expected1],
  [input2, expected2],
])('should handle %p correctly', (input, expected) => {
  expect(processInput(input)).toBe(expected)
})

// Use conditional tests for platform-specific behavior
const isLinux = process.platform === 'linux'
test.if(isLinux)('should work on Linux', () => {
  // Linux-specific test
})
```

### Mock Patterns with Bun
```typescript
// Function mocking
const mockFn = mock(() => 'mocked result')

// Module mocking
mock.module('./dependency', () => ({
  exportedFunction: mock(() => 'mocked')
}))

// Spy on existing functions
const spy = spyOn(object, 'method')

// Clean up mocks
afterEach(() => {
  mock.restore() // Restore all mocks
})
```

### Configuration Best Practices
```toml
# bunfig.toml
[test]
preload = ["./src/__tests__/setup.ts"]
timeout = 10000
coverage = true
```

### Error Handling and Debugging
- **Use Bun's detailed stack traces** for error diagnosis
- **Leverage test filtering** for isolating problematic tests
- **Use snapshot testing** for complex object comparisons
- **Apply test.failing()** for tracking known issues
- **Use assertion counting** for async test validation
- **For large test analysis**: redirect to file and use grep patterns
  ```bash
  # Capture and analyze large test runs
  bun test > test_output.log 2>&1

  # Find failing tests
  grep "(fail)" test_output.log

  # Find error patterns
  grep -i "error\|exception\|timeout" test_output.log

  # Get context around failures
  grep -A 5 -B 5 "(fail)" test_output.log

  # Run specific failing tests
  bun test -t "pattern-from-grep"

  # Analyze performance issues
  grep -E "\([0-9]{3,}ms\)" test_output.log
  ```