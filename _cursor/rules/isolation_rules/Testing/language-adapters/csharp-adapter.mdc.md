---
description: C# Language Adapter for Universal Testing
globs: csharp-adapter.mdc, cs-testing.mdc, **/csharp-test-*.mdc
alwaysApply: false
---

# C# LANGUAGE ADAPTER

> **TL;DR:** C# adapter supporting xUnit, NUnit, MSTest, .NET Core/Framework. Implements Rules #8-16 with C#-specific optimizations.

## 🎯 SUPPORTED ENVIRONMENTS
- **.NET 6+, .NET Framework 4.8** | **xUnit/NUnit/MSTest** | **Visual Studio/Rider**

## 🔍 DETECTION
```yaml
csharp_detection:
  indicators: ["*.cs", "*.csproj", "*.sln", "bin/obj directories"]
  frameworks:
    xunit: "xunit in PackageReference"
    nunit: "NUnit in PackageReference"
    mstest: "MSTest in PackageReference"
  build_tools:
    dotnet: ".csproj files present"
    msbuild: ".sln files present"
```

## 🎯 UNIVERSAL RULES

### Rule #8: Granular Tests (AAA Pattern)
```csharp
[Fact]
[DisplayName("Should return expected result when given valid input")]
public void ShouldReturnExpectedResultWhenGivenValidInput()
{
    // Arrange
    var input = "valid input";
    var component = new ComponentName();

    // Act
    var result = component.ProcessInput(input);

    // Assert
    Assert.Equal("expected output", result);
}
```

### Rule #9: Test Isolation (IDisposable + Setup/Teardown)
```csharp
public class IsolatedComponentTest : IDisposable
{
    private readonly TestDataBuilder _testDataBuilder;
    private readonly MockServiceProvider _mockServices;

    public IsolatedComponentTest()
    {
        _testDataBuilder = new TestDataBuilder();
        _mockServices = new MockServiceProvider();
    }

    public void Dispose()
    {
        _mockServices?.Reset();
        _testDataBuilder?.Dispose();
    }
}
```

### Rule #10: Feature Testing ([Trait] attributes)
```csharp
[Trait("Category", "Unit")]
public class UserServiceUnitTest { }

[Trait("Category", "Integration")]
public class UserServiceIntegrationTest { }

[Trait("Category", "E2E")]
public class UserServiceE2ETest { }
```

### Rule #11: Coverage (coverlet)
```xml
<PackageReference Include="coverlet.collector" Version="6.0.0" />
<PackageReference Include="coverlet.msbuild" Version="6.0.0" />
```

### Rule #12: Edge Cases ([Theory] + Property-based with FsCheck)
```csharp
[Theory]
[InlineData(int.MinValue)]
[InlineData(-1)]
[InlineData(0)]
[InlineData(1)]
[InlineData(int.MaxValue)]
public void ShouldHandleBoundaryValues(int value)
{
    var exception = Record.Exception(() => NumberProcessor.Process(value));
    Assert.Null(exception);
}

[Property]
public bool StringProcessingHandlesAllInputs(string input)
{
    var result = StringProcessor.Process(input);
    return result != null;
}
```

### Rule #13: Performance (BenchmarkDotNet)
```csharp
[Benchmark]
public List<string> BenchmarkAlgorithm()
{
    return Algorithm.Process(_testData);
}

[Fact]
public void ShouldCompleteWithinPerformanceThreshold()
{
    var stopwatch = Stopwatch.StartNew();
    var result = ExpensiveOperation.Process(_largeDataSet);
    stopwatch.Stop();

    Assert.True(stopwatch.ElapsedMilliseconds < 1000);
    Assert.NotEmpty(result);
}
```

### Rule #14: Precise Timing (Stopwatch.GetTimestamp())
```csharp
public static TimingResult<T> MeasureExecution<T>(Func<T> operation)
{
    var startTimestamp = Stopwatch.GetTimestamp();
    var result = operation();
    var endTimestamp = Stopwatch.GetTimestamp();

    var elapsedTicks = endTimestamp - startTimestamp;
    var elapsedNanoseconds = elapsedTicks * 1_000_000_000 / Stopwatch.Frequency;

    return new TimingResult<T>(result, elapsedNanoseconds);
}
```

### Rule #15: Secure ID (RNGCryptoServiceProvider + Guid)
```csharp
[Fact]
public void ShouldGenerateSecureGuids()
{
    var generatedIds = new HashSet<Guid>();

    for (int i = 0; i < 10000; i++)
    {
        var secureId = Guid.NewGuid();
        Assert.NotEqual(Guid.Empty, secureId);
        Assert.False(generatedIds.Contains(secureId));
        generatedIds.Add(secureId);
    }

    Assert.Equal(10000, generatedIds.Count);
}

[Fact]
public void ShouldGenerateSecureRandomBytes()
{
    using var rng = RandomNumberGenerator.Create();
    var generatedValues = new HashSet<string>();

    for (int i = 0; i < 1000; i++)
    {
        var bytes = new byte[32];
        rng.GetBytes(bytes);
        var hexString = Convert.ToHexString(bytes);
        Assert.False(generatedValues.Contains(hexString));
        generatedValues.Add(hexString);
    }
}
```

### Rule #16: Concurrency (Task.Run + Parallel.ForEach)
```csharp
[Fact]
public async Task ShouldHandleConcurrentOperations()
{
    var sharedCounter = 0;
    var tasks = new List<Task>();

    for (int i = 0; i < 10; i++)
    {
        tasks.Add(Task.Run(() =>
        {
            for (int j = 0; j < 1000; j++)
            {
                Interlocked.Increment(ref sharedCounter);
            }
        }));
    }

    await Task.WhenAll(tasks);
    Assert.Equal(10000, sharedCounter);
}

[Fact]
public void ShouldTestParallelOperations()
{
    var numbers = Enumerable.Range(0, 1000).ToList();
    var results = new ConcurrentBag<int>();

    Parallel.ForEach(numbers, number =>
    {
        results.Add(number * number);
    });

    Assert.Equal(1000, results.Count);
}
```

## 🔧 COMMANDS
```yaml
commands:
  test: "dotnet test"
  coverage: "dotnet test --collect:\"XPlat Code Coverage\""
  unit: "dotnet test --filter Category=Unit"
  integration: "dotnet test --filter Category=Integration"
  performance: "dotnet run --project PerformanceBenchmarks"
  benchmark: "dotnet run -c Release --project Benchmarks"
```

## 📊 CONFIG
```yaml
csharp_config:
  default_framework: "xunit"
  fallback_frameworks: ["nunit", "mstest"]
  thresholds: { lines: 90, branches: 85, functions: 95 }
  performance_targets: { test_execution: "20s/100tests", detection: "200ms" }

  framework_priorities:
    - { name: "xunit", score: 100, indicators: ["xunit in PackageReference"] }
    - { name: "nunit", score: 80, indicators: ["NUnit in PackageReference"] }
    - { name: "mstest", score: 60, indicators: ["MSTest in PackageReference"] }
```

---
**Status:** ✅ COMPLETE - C# Adapter | **Frameworks:** xUnit, NUnit, MSTest, .NET Core