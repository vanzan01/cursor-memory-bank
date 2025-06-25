---
description: Rust Language Adapter for Universal Testing
globs: rust-adapter.mdc, rust-testing.mdc, **/rust-test-*.mdc
alwaysApply: false
---

# RUST LANGUAGE ADAPTER

> **TL;DR:** Rust adapter supporting built-in testing, criterion benchmarks. Implements Rules #8-16 with Rust-specific optimizations.

## 🎯 SUPPORTED ENVIRONMENTS
- **Rust 1.70+** | **built-in test framework, criterion** | **Cargo**

## 🔍 DETECTION
```yaml
rust_detection:
  indicators: ["*.rs", "Cargo.toml", "Cargo.lock", "src/", "target/"]
  frameworks:
    builtin: "#[test] attributes in *.rs files"
    criterion: "criterion in Cargo.toml dependencies"
    proptest: "proptest in Cargo.toml dependencies"
```

## 🎯 UNIVERSAL RULES

### Rule #8: Granular Tests (AAA Pattern)
```rust
#[test]
fn should_return_expected_result_when_given_valid_input() {
    // Arrange
    let input = "valid input";
    let component = Component::new();
    let expected = "expected output";

    // Act
    let result = component.process_input(input);

    // Assert
    assert_eq!(expected, result);
}

#[test]
#[should_panic(expected = "Invalid input")]
fn should_panic_when_given_invalid_input() {
    let component = Component::new();
    component.process_input("");
}
```

### Rule #9: Test Isolation (Drop trait + setup/teardown)
```rust
struct TestFixture {
    test_data: TestData,
    mock_services: MockServices,
}

impl TestFixture {
    fn new() -> Self {
        Self {
            test_data: TestData::create(),
            mock_services: MockServices::new(),
        }
    }
}

impl Drop for TestFixture {
    fn drop(&mut self) {
        self.mock_services.reset();
        self.test_data.cleanup();
    }
}

#[test]
fn test_with_isolation() {
    let _fixture = TestFixture::new();
    // Test implementation with automatic cleanup
}
```

### Rule #10: Feature Testing (cfg attributes)
```rust
#[cfg(test)]
mod unit_tests {
    #[test] fn test_unit_functionality() { }
}

#[cfg(feature = "integration-tests")]
mod integration_tests {
    #[test] fn test_integration_functionality() { }
}

#[cfg(feature = "e2e-tests")]
mod e2e_tests {
    #[test] fn test_e2e_functionality() { }
}
```

### Rule #11: Coverage (cargo-tarpaulin)
```toml
# Cargo.toml
[dev-dependencies]
tarpaulin = "0.27"
```

### Rule #12: Edge Cases (proptest)
```rust
use proptest::prelude::*;

proptest! {
    #[test]
    fn string_processing_handles_all_inputs(input in ".*") {
        let result = string_processor::process(&input);
        prop_assert!(result.is_ok());
    }
}

#[test]
fn should_handle_boundary_values() {
    let boundaries = vec![i32::MIN, -1, 0, 1, i32::MAX];

    for value in boundaries {
        let result = std::panic::catch_unwind(|| {
            number_processor::process(value)
        });
        assert!(result.is_ok());
    }
}
```

### Rule #13: Performance (criterion)
```rust
use criterion::{black_box, criterion_group, criterion_main, Criterion};

fn benchmark_algorithm(c: &mut Criterion) {
    let test_data = generate_test_data(1000);

    c.bench_function("algorithm", |b| {
        b.iter(|| algorithm::process(black_box(&test_data)))
    });
}

criterion_group!(benches, benchmark_algorithm);
criterion_main!(benches);

#[test]
fn should_complete_within_performance_threshold() {
    let start = std::time::Instant::now();
    let result = expensive_operation::process(&large_data_set);
    let duration = start.elapsed();

    assert!(duration < std::time::Duration::from_secs(1));
    assert!(!result.is_empty());
}
```

### Rule #14: Precise Timing (std::time::Instant)
```rust
use std::time::Instant;

fn measure_execution<F, T>(operation: F) -> (T, std::time::Duration)
where
    F: FnOnce() -> T,
{
    let start = Instant::now();
    let result = operation();
    let duration = start.elapsed();
    (result, duration)
}

#[test]
fn test_precise_timing() {
    let (result, duration) = measure_execution(|| {
        expensive_operation()
    });

    assert!(result.is_some());
    assert!(duration > std::time::Duration::from_nanos(0));
    assert!(duration < std::time::Duration::from_secs(1));
}
```

### Rule #15: Secure ID (rand crate with OsRng)
```rust
use rand::{rngs::OsRng, RngCore};
use std::collections::HashSet;

#[test]
fn should_generate_secure_ids() {
    let mut generated_ids = HashSet::new();
    let mut rng = OsRng;

    for _ in 0..10000 {
        let mut bytes = [0u8; 16];
        rng.fill_bytes(&mut bytes);
        let id = hex::encode(bytes);

        assert!(!generated_ids.contains(&id));
        generated_ids.insert(id);
    }

    assert_eq!(generated_ids.len(), 10000);
}

#[test]
fn should_generate_high_entropy_values() {
    let mut rng = OsRng;
    let mut byte_counts = [0u32; 256];
    let sample_size = 10000;

    for _ in 0..sample_size {
        let byte = rng.next_u32() as u8;
        byte_counts[byte as usize] += 1;
    }

    // Check for reasonable distribution
    let expected_frequency = sample_size as f64 / 256.0;
    for &count in &byte_counts {
        let deviation = (count as f64 - expected_frequency).abs();
        assert!(deviation < expected_frequency * 0.2);
    }
}
```

### Rule #16: Concurrency (tokio + std::thread)
```rust
use std::sync::{Arc, Mutex};
use std::thread;
use tokio::sync::Semaphore;

#[test]
fn should_handle_concurrent_operations() {
    let counter = Arc::new(Mutex::new(0));
    let mut handles = vec![];

    for _ in 0..10 {
        let counter_clone = Arc::clone(&counter);
        let handle = thread::spawn(move || {
            for _ in 0..1000 {
                let mut num = counter_clone.lock().unwrap();
                *num += 1;
            }
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    assert_eq!(*counter.lock().unwrap(), 10000);
}

#[tokio::test]
async fn should_handle_async_concurrency() {
    let semaphore = Arc::new(Semaphore::new(5));
    let mut tasks = vec![];

    for i in 0..10 {
        let permit = semaphore.clone();
        let task = tokio::spawn(async move {
            let _permit = permit.acquire().await.unwrap();
            tokio::time::sleep(tokio::time::Duration::from_millis(100)).await;
            i * 2
        });
        tasks.push(task);
    }

    let results: Vec<i32> = futures::future::join_all(tasks)
        .await
        .into_iter()
        .map(|r| r.unwrap())
        .collect();

    assert_eq!(results.len(), 10);
}
```

## 🔧 COMMANDS
```yaml
commands:
  test: "cargo test"
  coverage: "cargo tarpaulin --out Html"
  unit: "cargo test --lib"
  integration: "cargo test --test '*'"
  benchmark: "cargo bench"
  doc_test: "cargo test --doc"
```

## 📊 CONFIG
```yaml
rust_config:
  default_framework: "builtin"
  fallback_frameworks: ["criterion", "proptest"]
  thresholds: { lines: 85, branches: 80, functions: 90 }
  performance_targets: { test_execution: "10s/100tests", detection: "100ms" }
```

---
**Status:** ✅ COMPLETE - Rust Adapter | **Frameworks:** built-in, criterion, proptest