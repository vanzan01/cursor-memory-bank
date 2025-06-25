---
description: Go Language Adapter for Universal Testing
globs: go-adapter.mdc, go-testing.mdc, **/go-test-*.mdc
alwaysApply: false
---

# GO LANGUAGE ADAPTER

> **TL;DR:** Go adapter supporting built-in testing, Testify, Ginkgo. Implements Rules #8-16 with Go-specific optimizations.

## 🎯 SUPPORTED ENVIRONMENTS
- **Go 1.19+** | **testing package, Testify, Ginkgo** | **go mod**

## 🔍 DETECTION
```yaml
go_detection:
  indicators: ["*.go", "go.mod", "go.sum"]
  frameworks:
    builtin: "testing package imports"
    testify: "github.com/stretchr/testify in go.mod"
    ginkgo: "github.com/onsi/ginkgo in go.mod"
```

## 🎯 UNIVERSAL RULES

### Rule #8: Granular Tests (AAA Pattern)
```go
func TestShouldReturnExpectedResultWhenGivenValidInput(t *testing.T) {
    // Arrange
    input := "valid input"
    component := NewComponent()
    expected := "expected output"

    // Act
    result := component.ProcessInput(input)

    // Assert
    assert.Equal(t, expected, result)
}
```

### Rule #9: Test Isolation (setup/teardown)
```go
func TestWithIsolation(t *testing.T) {
    // Setup
    testData := createTestData()
    mockServices := createMockServices()
    defer func() {
        // Teardown
        mockServices.Reset()
        cleanupTestData(testData)
    }()

    // Test implementation
}
```

### Rule #10: Feature Testing (build tags)
```go
//go:build unit
func TestUserServiceUnit(t *testing.T) { }

//go:build integration
func TestUserServiceIntegration(t *testing.T) { }

//go:build e2e
func TestUserServiceE2E(t *testing.T) { }
```

### Rule #11: Coverage (go test -cover)
```bash
go test -cover -coverprofile=coverage.out
go tool cover -html=coverage.out
```

### Rule #12: Edge Cases (property-based with testing/quick)
```go
func TestStringProcessingHandlesAllInputs(t *testing.T) {
    f := func(input string) bool {
        result := StringProcessor.Process(input)
        return result != ""
    }

    if err := quick.Check(f, nil); err != nil {
        t.Error(err)
    }
}

func TestBoundaryValues(t *testing.T) {
    boundaries := []int{math.MinInt, -1, 0, 1, math.MaxInt}
    for _, value := range boundaries {
        assert.NotPanics(t, func() {
            NumberProcessor.Process(value)
        })
    }
}
```

### Rule #13: Performance (testing.B)
```go
func BenchmarkAlgorithm(b *testing.B) {
    testData := generateTestData(1000)
    b.ResetTimer()

    for i := 0; i < b.N; i++ {
        Algorithm.Process(testData)
    }
}

func TestPerformanceThreshold(t *testing.T) {
    start := time.Now()
    result := ExpensiveOperation.Process(largeDataSet)
    duration := time.Since(start)

    assert.Less(t, duration, time.Second)
    assert.NotEmpty(t, result)
}
```

### Rule #14: Precise Timing (time.Now())
```go
func MeasureExecution(operation func()) (result interface{}, duration time.Duration) {
    start := time.Now()
    result = operation()
    duration = time.Since(start)
    return
}

func TestPreciseTiming(t *testing.T) {
    _, duration := MeasureExecution(func() interface{} {
        return expensiveOperation()
    })

    assert.Greater(t, duration, time.Duration(0))
    assert.Less(t, duration, time.Second)
}
```

### Rule #15: Secure ID (crypto/rand)
```go
func TestSecureIDGeneration(t *testing.T) {
    generatedIDs := make(map[string]bool)

    for i := 0; i < 10000; i++ {
        id := generateSecureID()
        assert.NotEmpty(t, id)
        assert.False(t, generatedIDs[id], "Duplicate ID generated")
        generatedIDs[id] = true
    }
}

func generateSecureID() string {
    bytes := make([]byte, 16)
    if _, err := rand.Read(bytes); err != nil {
        panic(err)
    }
    return hex.EncodeToString(bytes)
}
```

### Rule #16: Concurrency (goroutines + channels)
```go
func TestConcurrentOperations(t *testing.T) {
    var counter int64
    var wg sync.WaitGroup

    for i := 0; i < 10; i++ {
        wg.Add(1)
        go func() {
            defer wg.Done()
            for j := 0; j < 1000; j++ {
                atomic.AddInt64(&counter, 1)
            }
        }()
    }

    wg.Wait()
    assert.Equal(t, int64(10000), counter)
}

func TestChannelCommunication(t *testing.T) {
    ch := make(chan int, 10)
    var wg sync.WaitGroup

    // Producer
    wg.Add(1)
    go func() {
        defer wg.Done()
        defer close(ch)
        for i := 0; i < 10; i++ {
            ch <- i
        }
    }()

    // Consumer
    var results []int
    wg.Add(1)
    go func() {
        defer wg.Done()
        for value := range ch {
            results = append(results, value)
        }
    }()

    wg.Wait()
    assert.Len(t, results, 10)
}
```

## 🔧 COMMANDS
```yaml
commands:
  test: "go test ./..."
  coverage: "go test -cover -coverprofile=coverage.out ./..."
  unit: "go test -tags=unit ./..."
  integration: "go test -tags=integration ./..."
  benchmark: "go test -bench=. ./..."
  race: "go test -race ./..."
```

## 📊 CONFIG
```yaml
go_config:
  default_framework: "builtin"
  fallback_frameworks: ["testify", "ginkgo"]
  thresholds: { lines: 85, branches: 80, functions: 90 }
  performance_targets: { test_execution: "15s/100tests", detection: "150ms" }
```

---
**Status:** ✅ COMPLETE - Go Adapter | **Frameworks:** testing, Testify, Ginkgo