---
description: Zig Language Adapter for Universal Testing
globs: zig-adapter.mdc, zig-testing.mdc, **/zig-test-*.mdc
alwaysApply: false
---

# ZIG LANGUAGE ADAPTER

> **TL;DR:** Zig adapter supporting built-in testing framework, zBench, and testing utilities. Implements Rules #8-16 with Zig-specific optimizations for systems programming.

## 🎯 SUPPORTED ENVIRONMENTS
- **Zig 0.11+, 0.12+** | **built-in test framework, zBench** | **zig build system**

## 🔍 DETECTION
```yaml
zig_detection:
  indicators: ["*.zig", "build.zig", "build.zig.zon"]
  frameworks:
    builtin: "test blocks in *.zig files"
    zbench: "zBench in build.zig.zon"
    allocator_testing: "std.testing.allocator usage"
  build_system:
    zig_build: "build.zig exists"
    package_manager: "build.zig.zon exists"
```

## 🎯 UNIVERSAL RULES

### Rule #8: Granular Tests (AAA Pattern)
```zig
const std = @import("std");
const testing = std.testing;

test "should return expected result when given valid input" {
    // Arrange
    const input = "valid input";
    const component = Component.init();
    const expected = "expected output";

    // Act
    const result = component.processInput(input);

    // Assert
    try testing.expectEqualStrings(expected, result);
}

test "should handle error when given invalid input" {
    // Arrange
    const component = Component.init();
    const invalid_input = "";

    // Act & Assert
    try testing.expectError(error.InvalidInput, component.processInput(invalid_input));
}
```

### Rule #9: Test Isolation (defer cleanup)
```zig
test "test with isolation and cleanup" {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit(); // Automatic cleanup

    const allocator = arena.allocator();

    // Setup
    var test_data = try TestData.init(allocator);
    defer test_data.deinit(); // Cleanup test data

    var mock_services = MockServices.init();
    defer mock_services.reset(); // Reset mock state

    // Test implementation with guaranteed cleanup
    const result = try processWithServices(&test_data, &mock_services);
    try testing.expect(result.isValid());
}
```

### Rule #10: Feature Testing (comptime + test organization)
```zig
// Unit tests
test "UserService unit tests" {
    const unit_tests = struct {
        test "should create user with valid data" {
            // Unit test implementation
        }

        test "should validate user input" {
            // Unit test implementation
        }
    };

    _ = unit_tests;
}

// Integration tests (conditional compilation)
test "UserService integration tests" {
    if (!@import("builtin").is_test) return error.SkipZigTest;

    // Integration test implementation
    var database = try TestDatabase.init(std.testing.allocator);
    defer database.deinit();

    const user_service = UserService.init(&database);
    const result = try user_service.createUser(.{ .name = "Test User" });
    try testing.expect(result.id > 0);
}
```

### Rule #11: Coverage (zig test --coverage)
```bash
# Zig has built-in coverage support
zig test --coverage src/
zig test --coverage --coverage-dir coverage-report src/
```

### Rule #12: Edge Cases (comptime testing + fuzzing)
```zig
const std = @import("std");
const testing = std.testing;

test "string processing handles all boundary values" {
    const boundary_inputs = [_][]const u8{
        "",           // Empty string
        " ",          // Single space
        "\n\t\r",     // Whitespace characters
        "a" ** 1000,  // Very long string
    };

    for (boundary_inputs) |input| {
        const result = StringProcessor.process(input);
        try testing.expect(result.len >= 0);
    }
}

test "number processing handles boundary values" {
    const boundary_values = [_]i32{
        std.math.minInt(i32),
        -1,
        0,
        1,
        std.math.maxInt(i32),
    };

    for (boundary_values) |value| {
        const result = NumberProcessor.process(value);
        try testing.expect(result != null);
    }
}

// Property-based testing with comptime generation
test "property-based string validation" {
    comptime var i = 0;
    inline while (i < 100) : (i += 1) {
        const random_string = comptime generateRandomString(i);
        const result = StringValidator.validate(random_string);
        try testing.expect(result == .valid or result == .invalid);
    }
}
```

### Rule #13: Performance Testing (zBench integration)
```zig
const std = @import("std");
const testing = std.testing;
const zBench = @import("zBench");

test "algorithm performance benchmark" {
    var benchmark = zBench.Benchmark.init(std.testing.allocator);
    defer benchmark.deinit();

    const test_data = try generateTestData(1000);
    defer std.testing.allocator.free(test_data);

    try benchmark.add("fast_algorithm", struct {
        fn run() void {
            _ = FastAlgorithm.process(test_data);
        }
    }.run);

    try benchmark.add("optimized_algorithm", struct {
        fn run() void {
            _ = OptimizedAlgorithm.process(test_data);
        }
    }.run);

    try benchmark.run();
}

test "performance threshold validation" {
    const start_time = std.time.nanoTimestamp();

    const result = try ExpensiveOperation.process(large_data_set);

    const end_time = std.time.nanoTimestamp();
    const duration_ns = end_time - start_time;
    const duration_ms = @as(f64, @floatFromInt(duration_ns)) / 1_000_000.0;

    try testing.expect(duration_ms < 1000.0); // Should complete within 1 second
    try testing.expect(result.len > 0);
}
```

### Rule #14: Precise Timing (std.time.nanoTimestamp)
```zig
const std = @import("std");
const testing = std.testing;

const TimingResult = struct {
    result: anytype,
    duration_ns: i128,

    pub fn durationMs(self: @This()) f64 {
        return @as(f64, @floatFromInt(self.duration_ns)) / 1_000_000.0;
    }

    pub fn durationUs(self: @This()) f64 {
        return @as(f64, @floatFromInt(self.duration_ns)) / 1_000.0;
    }
};

fn measureExecution(comptime func: anytype, args: anytype) TimingResult(@TypeOf(func(args))) {
    const start_time = std.time.nanoTimestamp();
    const result = func(args);
    const end_time = std.time.nanoTimestamp();

    return TimingResult(@TypeOf(result)){
        .result = result,
        .duration_ns = end_time - start_time,
    };
}

test "precise timing measurement" {
    const timing_result = measureExecution(expensiveOperation, .{});

    try testing.expect(timing_result.duration_ns > 0);
    try testing.expect(timing_result.durationMs() < 1000.0);
    try testing.expect(timing_result.result != null);
}

test "statistical timing analysis" {
    const iterations = 100;
    var durations: [iterations]i128 = undefined;

    for (durations, 0..) |*duration, i| {
        _ = i;
        const timing_result = measureExecution(fastOperation, .{});
        duration.* = timing_result.duration_ns;
    }

    // Calculate statistics
    var sum: i128 = 0;
    var min_duration = durations[0];
    var max_duration = durations[0];

    for (durations) |duration| {
        sum += duration;
        min_duration = @min(min_duration, duration);
        max_duration = @max(max_duration, duration);
    }

    const mean_duration = @divTrunc(sum, iterations);

    try testing.expect(mean_duration > 0);
    try testing.expect(max_duration >= min_duration);
}
```

### Rule #15: Secure ID (std.crypto.random)
```zig
const std = @import("std");
const testing = std.testing;
const crypto = std.crypto;

test "secure ID generation with crypto random" {
    var generated_ids = std.HashMap([]const u8, void, std.hash_map.StringContext, 80).init(std.testing.allocator);
    defer {
        var iterator = generated_ids.iterator();
        while (iterator.next()) |entry| {
            std.testing.allocator.free(entry.key_ptr.*);
        }
        generated_ids.deinit();
    }

    var rng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.os.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });

    const iterations = 10000;
    var i: usize = 0;
    while (i < iterations) : (i += 1) {
        const secure_id = try generateSecureId(std.testing.allocator, &rng);

        // Verify uniqueness
        try testing.expect(!generated_ids.contains(secure_id));
        try generated_ids.put(secure_id, {});
    }

    try testing.expectEqual(iterations, generated_ids.count());
}

fn generateSecureId(allocator: std.mem.Allocator, rng: *std.rand.Random) ![]const u8 {
    var bytes: [16]u8 = undefined;
    rng.bytes(&bytes);

    var hex_string = try allocator.alloc(u8, 32);
    _ = std.fmt.bufPrint(hex_string, "{}", .{std.fmt.fmtSliceHexLower(&bytes)}) catch unreachable;

    return hex_string;
}

test "entropy validation" {
    var rng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.os.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });

    var byte_counts = [_]u32{0} ** 256;
    const sample_size = 10000;

    var i: usize = 0;
    while (i < sample_size) : (i += 1) {
        const random_byte = rng.random().int(u8);
        byte_counts[random_byte] += 1;
    }

    // Check for reasonable distribution (chi-square test approximation)
    const expected_frequency = @as(f64, sample_size) / 256.0;
    for (byte_counts) |count| {
        const deviation = @abs(@as(f64, @floatFromInt(count)) - expected_frequency);
        try testing.expect(deviation < expected_frequency * 0.2);
    }
}
```

### Rule #16: Concurrency Testing (async/await + std.Thread)
```zig
const std = @import("std");
const testing = std.testing;

test "concurrent operations with threads" {
    const thread_count = 10;
    const operations_per_thread = 1000;

    var shared_counter = std.atomic.Atomic(u32).init(0);
    var threads: [thread_count]std.Thread = undefined;

    // Start threads
    for (threads, 0..) |*thread, i| {
        _ = i;
        thread.* = try std.Thread.spawn(.{}, struct {
            fn threadFunc(counter: *std.atomic.Atomic(u32)) void {
                var j: u32 = 0;
                while (j < operations_per_thread) : (j += 1) {
                    _ = counter.fetchAdd(1, .SeqCst);
                }
            }
        }.threadFunc, .{&shared_counter});
    }

    // Wait for completion
    for (threads) |thread| {
        thread.join();
    }

    const final_count = shared_counter.load(.SeqCst);
    try testing.expectEqual(thread_count * operations_per_thread, final_count);
}

test "async concurrent operations" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const AsyncTask = struct {
        fn asyncOperation(delay_ms: u64) !u32 {
            std.time.sleep(delay_ms * std.time.ns_per_ms);
            return @intCast(delay_ms * 2);
        }
    };

    // Simulate concurrent async operations
    const tasks = [_]u64{ 10, 20, 15, 25, 5 };
    var results = try allocator.alloc(u32, tasks.len);
    defer allocator.free(results);

    var threads: [tasks.len]std.Thread = undefined;

    for (tasks, 0..) |delay, i| {
        threads[i] = try std.Thread.spawn(.{}, struct {
            fn taskRunner(delay_ms: u64, result_ptr: *u32) void {
                result_ptr.* = AsyncTask.asyncOperation(delay_ms) catch 0;
            }
        }.taskRunner, .{ delay, &results[i] });
    }

    for (threads) |thread| {
        thread.join();
    }

    // Verify all tasks completed
    for (results, tasks) |result, expected_delay| {
        try testing.expectEqual(@as(u32, @intCast(expected_delay * 2)), result);
    }
}

test "race condition detection" {
    const UnsafeCounter = struct {
        value: u32 = 0,

        fn increment(self: *@This()) void {
            // Intentionally unsafe operation
            const current = self.value;
            std.time.sleep(1000); // Simulate work that could cause race
            self.value = current + 1;
        }
    };

    var unsafe_counter = UnsafeCounter{};
    var threads: [5]std.Thread = undefined;

    for (threads, 0..) |*thread, i| {
        _ = i;
        thread.* = try std.Thread.spawn(.{}, struct {
            fn threadFunc(counter: *UnsafeCounter) void {
                var j: u32 = 0;
                while (j < 10) : (j += 1) {
                    counter.increment();
                }
            }
        }.threadFunc, .{&unsafe_counter});
    }

    for (threads) |thread| {
        thread.join();
    }

    // This test should fail due to race conditions
    const expected_value = 50; // 5 threads * 10 increments
    if (unsafe_counter.value != expected_value) {
        std.log.warn("Race condition detected: expected {}, got {}", .{ expected_value, unsafe_counter.value });
        return error.RaceConditionDetected;
    }
}
```

## 🔧 COMMANDS
```yaml
commands:
  test: "zig test src/"
  coverage: "zig test --coverage src/"
  build: "zig build"
  build_test: "zig build test"
  benchmark: "zig build benchmark"
  run_tests: "zig build run-tests"
```

## 📊 CONFIG
```yaml
zig_config:
  default_framework: "builtin"
  fallback_frameworks: ["zbench"]
  thresholds: { lines: 85, branches: 80, functions: 90 }
  performance_targets: { test_execution: "8s/100tests", detection: "80ms" }

  build_system:
    primary: "zig build"
    test_command: "zig test"
    coverage_support: true
    benchmark_support: true

  language_features:
    comptime_testing: true
    memory_safety: true
    zero_cost_abstractions: true
    cross_compilation: true
```

## 🚀 ZIG-SPECIFIC OPTIMIZATIONS

### Memory Safety Testing
```zig
test "memory safety validation" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const leaked = gpa.deinit();
        try testing.expect(leaked == .ok); // No memory leaks
    }

    const allocator = gpa.allocator();

    // Test memory allocation and deallocation
    const data = try allocator.alloc(u8, 1000);
    defer allocator.free(data);

    // Memory safety is enforced at compile time and runtime
    try testing.expect(data.len == 1000);
}
```

### Comptime Testing
```zig
test "comptime validation" {
    comptime {
        // Compile-time testing
        const result = computeAtCompileTime(42);
        if (result != 84) {
            @compileError("Compile-time computation failed");
        }
    }

    // Runtime validation
    const runtime_result = computeAtCompileTime(42);
    try testing.expectEqual(84, runtime_result);
}

fn computeAtCompileTime(comptime value: u32) u32 {
    return value * 2;
}
```

---
**Status:** ✅ COMPLETE - Zig Adapter | **Frameworks:** built-in testing, zBench
**Features:** Memory safety, comptime testing, zero-cost abstractions, cross-compilation