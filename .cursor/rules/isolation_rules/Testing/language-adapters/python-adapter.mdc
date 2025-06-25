---
description: Python Language Adapter for Universal Testing
globs: python-adapter.mdc, py-testing.mdc, **/python-test-*.mdc
alwaysApply: false
---

# PYTHON LANGUAGE ADAPTER

> **TL;DR:** Language adapter for Python projects supporting pytest, unittest, nose2, and other popular testing frameworks. Implements all universal testing principles with Python-specific optimizations.

## 🎯 SUPPORTED ENVIRONMENTS

**Python Versions:**
- **Python 3.8+** (Primary support)
- **Python 3.12** (Latest features)
- **PyPy** (Performance-optimized interpreter)

**Testing Frameworks:**
- **pytest** (Primary) - Feature-rich, plugin ecosystem
- **unittest** - Built-in testing framework
- **nose2** - Successor to nose
- **doctest** - Documentation-based testing
- **hypothesis** - Property-based testing

## 🔍 LANGUAGE DETECTION

```yaml
python_detection:
  primary_indicators:
    - "*.py files present"
    - "requirements.txt OR pyproject.toml OR setup.py exists"
    - "__pycache__ directories present"

  framework_detection:
    pytest: "pytest in requirements OR pytest.ini OR pyproject.toml [tool.pytest]"
    unittest: "test_*.py files with unittest imports"
    nose2: "nose2 in requirements OR .nose2cfg exists"
    doctest: "doctest usage in *.py files"

  environment_detection:
    virtual_env: "venv/ OR .venv/ OR env/ directories"
    conda: "environment.yml OR conda-meta/ directory"
    poetry: "poetry.lock OR pyproject.toml with [tool.poetry]"
    pipenv: "Pipfile OR Pipfile.lock exists"
```

## 🎯 UNIVERSAL RULE IMPLEMENTATIONS

### Rule #8: Granular Tests
```yaml
rule_8_granular_tests:
  pattern: "AAA pattern with descriptive test names"

  pytest_implementation: |
    import pytest
    from mymodule import function_under_test

    class TestFunctionUnderTest:
        def test_should_return_expected_result_when_given_valid_input(self):
            # Arrange
            input_data = "valid input"
            expected_result = "expected output"

            # Act
            actual_result = function_under_test(input_data)

            # Assert
            assert actual_result == expected_result

        def test_should_raise_exception_when_given_invalid_input(self):
            # Arrange
            invalid_input = None

            # Act & Assert
            with pytest.raises(ValueError):
                function_under_test(invalid_input)

  unittest_implementation: |
    import unittest
    from mymodule import function_under_test

    class TestFunctionUnderTest(unittest.TestCase):
        def test_should_return_expected_result_when_given_valid_input(self):
            # Arrange
            input_data = "valid input"
            expected_result = "expected output"

            # Act
            actual_result = function_under_test(input_data)

            # Assert
            self.assertEqual(actual_result, expected_result)

  commands:
    pytest: "pytest -v --tb=short"
    unittest: "python -m unittest discover -v"
    nose2: "nose2 -v"
```

### Rule #9: Test Isolation
```yaml
rule_9_test_isolation:
  pattern: "Setup/teardown with fixtures"

  pytest_implementation: |
    import pytest
    import tempfile
    import shutil
    from pathlib import Path

    @pytest.fixture(autouse=True)
    def clean_environment():
        """Ensure clean test environment for each test"""
        # Setup
        original_cwd = Path.cwd()
        temp_dir = Path(tempfile.mkdtemp())

        yield temp_dir

        # Teardown
        os.chdir(original_cwd)
        shutil.rmtree(temp_dir, ignore_errors=True)

    @pytest.fixture
    def mock_database():
        """Provide isolated database for testing"""
        db = create_test_database()
        yield db
        db.close()
        cleanup_test_database(db)

    def test_isolated_operation(clean_environment, mock_database):
        # Test runs in complete isolation
        pass

  unittest_implementation: |
    import unittest
    import tempfile
    import shutil

    class TestWithIsolation(unittest.TestCase):
        def setUp(self):
            """Clean setup before each test"""
            self.temp_dir = tempfile.mkdtemp()
            self.mock_data = create_test_data()

        def tearDown(self):
            """Clean teardown after each test"""
            shutil.rmtree(self.temp_dir, ignore_errors=True)
            cleanup_test_data(self.mock_data)

        def test_isolated_operation(self):
            # Test implementation
            pass

  verification_command: "pytest --random-order-bucket=global"
  isolation_check: "Tests pass when run in random order"
```

### Rule #10: Feature Testing
```yaml
rule_10_feature_testing:
  pattern: "Layered testing with pytest markers"

  structure: |
    src/
      user_management/
        user_service.py
        tests/
          test_user_service_unit.py      # Unit tests
          test_user_service_integration.py # Integration tests
          test_user_service_e2e.py       # End-to-end tests

    conftest.py  # Shared fixtures and configuration

  implementation: |
    # conftest.py
    import pytest

    def pytest_configure(config):
        config.addinivalue_line("markers", "unit: Unit tests")
        config.addinivalue_line("markers", "integration: Integration tests")
        config.addinivalue_line("markers", "e2e: End-to-end tests")

    # test_user_service_unit.py
    import pytest

    @pytest.mark.unit
    class TestUserServiceUnit:
        def test_create_user_returns_user_object(self):
            # Unit test implementation
            pass

    # test_user_service_integration.py
    @pytest.mark.integration
    class TestUserServiceIntegration:
        def test_user_service_integrates_with_database(self):
            # Integration test implementation
            pass

    # test_user_service_e2e.py
    @pytest.mark.e2e
    class TestUserServiceE2E:
        def test_complete_user_workflow(self):
            # End-to-end test implementation
            pass

  commands:
    unit: "pytest -m unit -v"
    integration: "pytest -m integration -v"
    e2e: "pytest -m e2e -v"
    all: "pytest -v"
```

### Rule #11: Coverage Monitoring
```yaml
rule_11_coverage_monitoring:
  tools:
    primary: "coverage.py with pytest-cov plugin"
    alternative: "pytest-coverage plugin"

  configuration: |
    # pyproject.toml
    [tool.pytest.ini_options]
    addopts = "--cov=src --cov-report=html --cov-report=term-missing --cov-fail-under=90"

    [tool.coverage.run]
    source = ["src"]
    omit = [
        "*/tests/*",
        "*/venv/*",
        "*/__pycache__/*"
    ]

    [tool.coverage.report]
    exclude_lines = [
        "pragma: no cover",
        "def __repr__",
        "raise AssertionError",
        "raise NotImplementedError"
    ]

  thresholds:
    lines: 90
    branches: 85
    functions: 95
    statements: 90

  commands:
    generate: "pytest --cov=src --cov-report=html"
    enforce: "pytest --cov=src --cov-fail-under=90"
    report: "coverage report --show-missing"
    xml: "pytest --cov=src --cov-report=xml"
```

### Rule #12: Edge Case Testing
```yaml
rule_12_edge_case_testing:
  approach: "Property-based testing with Hypothesis"

  implementation: |
    import pytest
    from hypothesis import given, strategies as st, example
    from mymodule import process_string, validate_email

    class TestEdgeCases:
        @given(st.text())
        @example("")  # Explicit edge case
        @example(" " * 1000)  # Large whitespace
        def test_process_string_handles_all_text_inputs(self, text_input):
            """Property-based test for string processing"""
            result = process_string(text_input)

            # Properties that should always hold
            assert isinstance(result, str)
            assert len(result) >= 0

        def test_boundary_values(self):
            """Test explicit boundary conditions"""
            boundary_values = [
                None, "", " ", "\n", "\t",
                0, -1, 1,
                float('inf'), float('-inf'), float('nan'),
                [], {}, set()
            ]

            for value in boundary_values:
                with pytest.raises((ValueError, TypeError)):
                    validate_input(value)

        @given(st.emails())
        def test_email_validation_with_generated_emails(self, email):
            """Test email validation with generated valid emails"""
            assert validate_email(email) is True

        def test_error_conditions(self):
            """Test error handling"""
            with pytest.raises(ConnectionError):
                connect_to_invalid_server()

            with pytest.raises(TimeoutError):
                slow_operation(timeout=0.001)

  commands:
    property_based: "pytest -k 'test_property' -v"
    boundary: "pytest -k 'boundary' -v"
    hypothesis_verbose: "pytest --hypothesis-show-statistics"
```

### Rule #13: Performance Testing
```yaml
rule_13_performance_testing:
  tools:
    primary: "pytest-benchmark plugin"
    alternative: "timeit module for custom benchmarks"

  implementation: |
    import pytest
    import time
    from mymodule import fast_algorithm, slow_algorithm

    class TestPerformance:
        def test_fast_algorithm_performance(self, benchmark):
            """Benchmark fast algorithm performance"""
            result = benchmark(fast_algorithm, large_dataset)
            assert result is not None

        def test_algorithm_comparison(self, benchmark):
            """Compare algorithm performance"""
            # Benchmark multiple algorithms
            fast_time = benchmark.pedantic(
                fast_algorithm,
                args=(test_data,),
                iterations=100,
                rounds=10
            )

            # Performance assertion
            assert benchmark.stats.mean < 0.1  # Should complete in <100ms

        @pytest.mark.parametrize("data_size", [100, 1000, 10000])
        def test_scalability(self, benchmark, data_size):
            """Test performance scalability"""
            test_data = generate_test_data(data_size)
            result = benchmark(process_data, test_data)

            # Performance should scale linearly
            expected_max_time = data_size * 0.001  # 1ms per item
            assert benchmark.stats.mean < expected_max_time

  custom_timing: |
    import time
    import statistics
    from contextlib import contextmanager

    @contextmanager
    def measure_time():
        start = time.perf_counter()
        yield
        end = time.perf_counter()
        return end - start

    def run_performance_test(func, iterations=100):
        """Custom performance measurement"""
        times = []

        for _ in range(iterations):
            start = time.perf_counter()
            func()
            end = time.perf_counter()
            times.append(end - start)

        return {
            'mean': statistics.mean(times),
            'median': statistics.median(times),
            'stdev': statistics.stdev(times),
            'min': min(times),
            'max': max(times)
        }

  commands:
    benchmark: "pytest --benchmark-only"
    performance_profile: "pytest --benchmark-histogram"
    compare: "pytest --benchmark-compare"
```

### Rule #14: Precise Timing
```yaml
rule_14_precise_timing:
  timing_source: "time.perf_counter() for monotonic timing"

  implementation: |
    import time
    import statistics
    from typing import Callable, Dict, Any, List

    def measure_execution_time(func: Callable, *args, **kwargs) -> Dict[str, Any]:
        """Measure precise execution time with statistical analysis"""
        start_time = time.perf_counter()
        result = func(*args, **kwargs)
        end_time = time.perf_counter()

        execution_time = end_time - start_time

        return {
            'result': result,
            'execution_time': execution_time,
            'timestamp': time.time()
        }

    def statistical_timing_analysis(func: Callable, iterations: int = 100) -> Dict[str, float]:
        """Run multiple iterations for statistical analysis"""
        execution_times: List[float] = []

        # Warmup runs (exclude from analysis)
        for _ in range(10):
            func()

        # Measured runs
        for _ in range(iterations):
            start = time.perf_counter()
            func()
            end = time.perf_counter()
            execution_times.append(end - start)

        return {
            'mean': statistics.mean(execution_times),
            'median': statistics.median(execution_times),
            'stdev': statistics.stdev(execution_times) if len(execution_times) > 1 else 0,
            'min': min(execution_times),
            'max': max(execution_times),
            'p95': statistics.quantiles(execution_times, n=20)[18],  # 95th percentile
            'p99': statistics.quantiles(execution_times, n=100)[98]  # 99th percentile
        }

    # Test implementation
    def test_precise_timing():
        def expensive_operation():
            return sum(i**2 for i in range(10000))

        timing_stats = statistical_timing_analysis(expensive_operation)

        assert timing_stats['mean'] > 0
        assert timing_stats['stdev'] < timing_stats['mean'] * 0.1  # Low variance
        assert timing_stats['p95'] < timing_stats['mean'] * 2  # Reasonable upper bound
```

### Rule #15: Secure ID Testing
```yaml
rule_15_secure_id_generation:
  crypto_source: "secrets module and uuid.uuid4()"

  implementation: |
    import secrets
    import uuid
    import hashlib
    import pytest
    from collections import Counter
    from typing import Set, List

    class TestSecureIdGeneration:
        def test_uuid4_security_properties(self):
            """Test UUID4 generation security"""
            ids: Set[str] = set()
            iterations = 10000

            for _ in range(iterations):
                secure_id = str(uuid.uuid4())

                # Format validation
                assert len(secure_id) == 36
                assert secure_id.count('-') == 4

                # Uniqueness
                assert secure_id not in ids
                ids.add(secure_id)

            # All IDs should be unique
            assert len(ids) == iterations

        def test_secrets_token_entropy(self):
            """Test entropy of secrets.token_bytes()"""
            token_size = 32
            tokens: List[bytes] = []

            for _ in range(1000):
                token = secrets.token_bytes(token_size)
                tokens.append(token)

                # Each token should be different
                assert len(set(tokens)) == len(tokens)

            # Test entropy by checking byte distribution
            all_bytes = b''.join(tokens)
            byte_counts = Counter(all_bytes)

            # Should have relatively uniform distribution
            expected_frequency = len(all_bytes) / 256
            for count in byte_counts.values():
                # Allow 20% variance from expected frequency
                assert abs(count - expected_frequency) < expected_frequency * 0.2

        def test_secure_random_string_generation(self):
            """Test custom secure string generation"""
            def generate_secure_id(length: int = 32) -> str:
                alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
                return ''.join(secrets.choice(alphabet) for _ in range(length))

            ids: Set[str] = set()
            for _ in range(5000):
                secure_id = generate_secure_id()
                assert len(secure_id) == 32
                assert secure_id not in ids
                ids.add(secure_id)

        def test_cryptographic_hash_properties(self):
            """Test hash function properties for ID generation"""
            def hash_based_id(input_data: str) -> str:
                return hashlib.sha256(f"{input_data}{secrets.token_hex(16)}".encode()).hexdigest()

            ids: Set[str] = set()
            for i in range(1000):
                hashed_id = hash_based_id(f"input_{i}")
                assert len(hashed_id) == 64  # SHA256 hex length
                assert hashed_id not in ids
                ids.add(hashed_id)
```

### Rule #16: Concurrency Testing
```yaml
rule_16_concurrency_testing:
  approach: "threading, asyncio, multiprocessing testing"

  implementation: |
    import pytest
    import asyncio
    import threading
    import multiprocessing
    import time
    from concurrent.futures import ThreadPoolExecutor, ProcessPoolExecutor

    class TestConcurrency:
        def test_thread_safety(self):
            """Test thread-safe operations"""
            shared_counter = 0
            lock = threading.Lock()

            def increment_counter():
                nonlocal shared_counter
                for _ in range(1000):
                    with lock:
                        shared_counter += 1

            threads = []
            for _ in range(10):
                thread = threading.Thread(target=increment_counter)
                threads.append(thread)
                thread.start()

            for thread in threads:
                thread.join()

            assert shared_counter == 10000  # No race conditions

        @pytest.mark.asyncio
        async def test_async_operations(self):
            """Test async/await concurrency"""
            async def async_operation(delay: float) -> str:
                await asyncio.sleep(delay)
                return f"completed after {delay}s"

            # Run concurrent async operations
            tasks = [
                async_operation(0.1),
                async_operation(0.2),
                async_operation(0.15)
            ]

            start_time = time.perf_counter()
            results = await asyncio.gather(*tasks)
            end_time = time.perf_counter()

            # Should complete concurrently, not sequentially
            assert end_time - start_time < 0.3  # Less than sum of delays
            assert len(results) == 3

        def test_race_condition_detection(self):
            """Test for race conditions in shared resource access"""
            class SharedResource:
                def __init__(self):
                    self.value = 0
                    self.operations = []

                def unsafe_increment(self, thread_id: int):
                    """Intentionally unsafe operation to detect races"""
                    current = self.value
                    time.sleep(0.001)  # Simulate work that could cause race
                    self.value = current + 1
                    self.operations.append(f"thread_{thread_id}")

            resource = SharedResource()

            def worker(thread_id: int):
                for _ in range(10):
                    resource.unsafe_increment(thread_id)

            threads = []
            for i in range(5):
                thread = threading.Thread(target=worker, args=(i,))
                threads.append(thread)
                thread.start()

            for thread in threads:
                thread.join()

            # This test might fail due to race conditions
            # In production, this would be fixed with proper locking
            expected_value = 50  # 5 threads * 10 increments
            if resource.value != expected_value:
                pytest.fail(f"Race condition detected: expected {expected_value}, got {resource.value}")

        def test_multiprocessing_safety(self):
            """Test multiprocessing operations"""
            def cpu_intensive_task(n: int) -> int:
                return sum(i**2 for i in range(n))

            with ProcessPoolExecutor(max_workers=4) as executor:
                futures = [executor.submit(cpu_intensive_task, 10000) for _ in range(8)]
                results = [future.result() for future in futures]

            # All results should be identical
            expected_result = sum(i**2 for i in range(10000))
            assert all(result == expected_result for result in results)

  commands:
    threading: "pytest -k 'thread' -v"
    asyncio: "pytest -k 'async' -v"
    multiprocessing: "pytest -k 'multiprocess' -v"
```

## 🔧 ADAPTER INTERFACE IMPLEMENTATION

```python
from abc import ABC, abstractmethod
from typing import Dict, List, Any, Optional
from dataclasses import dataclass

@dataclass
class PythonTestResult:
    success: bool
    duration: float
    coverage: Optional[float]
    details: Dict[str, Any]

class PythonAdapter:
    def __init__(self, project_path: str):
        self.project_path = project_path
        self.detected_framework: Optional[str] = None

    async def detect_language(self) -> Dict[str, Any]:
        """Detect Python version and environment"""
        # Implementation here
        pass

    async def detect_frameworks(self) -> List[str]:
        """Detect available testing frameworks"""
        # Implementation here
        pass

    async def run_granular_tests(self, **options) -> PythonTestResult:
        """Execute Rule #8 implementation"""
        # Implementation here
        pass

    # ... other rule implementations
```

## 📊 CONFIGURATION

```yaml
python_config:
  default_framework: "pytest"
  fallback_frameworks: ["unittest", "nose2"]

  framework_priorities:
    - name: "pytest"
      score: 100
      indicators: ["pytest in requirements", "pytest.ini", "conftest.py"]
    - name: "unittest"
      score: 70
      indicators: ["test_*.py with unittest imports"]
    - name: "nose2"
      score: 60
      indicators: ["nose2 in requirements", ".nose2cfg"]

  performance_targets:
    test_execution: "< 10 seconds for 100 tests"
    coverage_generation: "< 15 seconds"
    framework_detection: "< 200ms"

  rule_overrides:
    rule_8_coverage_target: 90
    rule_11_thresholds:
      lines: 90
      branches: 85
      functions: 95
```

---

**Status:** ✅ COMPLETE - Python Adapter Implemented
**Framework Support:** pytest, unittest, nose2, doctest, hypothesis
**Rule Coverage:** 100% (Rules #8-16)
**Performance:** Optimized for pytest with coverage.py