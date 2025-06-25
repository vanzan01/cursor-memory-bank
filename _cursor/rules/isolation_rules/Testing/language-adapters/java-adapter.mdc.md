---
description: Java Language Adapter for Universal Testing
globs: java-adapter.mdc, java-testing.mdc, **/java-test-*.mdc
alwaysApply: false
---

# JAVA LANGUAGE ADAPTER

> **TL;DR:** Java adapter supporting JUnit 5, TestNG, Maven/Gradle. Implements Rules #8-16 with Java-specific optimizations.

## 🎯 SUPPORTED ENVIRONMENTS
- **Java 11+, 17, 21** | **Maven/Gradle** | **JUnit 5/TestNG/Spock**

## 🔍 DETECTION
```yaml
java_detection:
  indicators: ["*.java", "pom.xml|build.gradle", "src/main/java"]
  frameworks:
    junit5: "junit-jupiter in dependencies"
    testng: "testng in dependencies"
    maven: "pom.xml exists"
    gradle: "build.gradle exists"
```

## 🎯 UNIVERSAL RULES

### Rule #8: Granular Tests (AAA Pattern)
```java
@Test @DisplayName("Should return expected result when given valid input")
void shouldReturnExpectedResultWhenGivenValidInput() {
    // Arrange
    String input = "valid input";
    ComponentName component = new ComponentName();

    // Act
    String result = component.processInput(input);

    // Assert
    assertEquals("expected output", result);
}
```

### Rule #9: Test Isolation (@BeforeEach/@AfterEach)
```java
@BeforeEach void setUp() { /* clean setup */ }
@AfterEach void tearDown() { /* cleanup */ }
```

### Rule #10: Feature Testing (@Tag annotations)
```java
@Tag("unit") class UserServiceUnitTest { }
@Tag("integration") class UserServiceIntegrationTest { }
@Tag("e2e") class UserServiceE2ETest { }
```

### Rule #11: Coverage (JaCoCo)
```xml
<plugin>
    <groupId>org.jacoco</groupId>
    <artifactId>jacoco-maven-plugin</artifactId>
    <configuration><rules><rule><limits>
        <limit><counter>LINE</counter><minimum>0.90</minimum></limit>
    </limits></rule></rules></configuration>
</plugin>
```

### Rule #12: Edge Cases (jqwik + @ParameterizedTest)
```java
@Property boolean stringProcessingHandlesAllInputs(@ForAll String input) {
    return StringProcessor.process(input) != null;
}

@ParameterizedTest @ValueSource(ints = {Integer.MIN_VALUE, -1, 0, 1, Integer.MAX_VALUE})
void shouldHandleBoundaryValues(int value) {
    assertDoesNotThrow(() -> NumberProcessor.process(value));
}
```

### Rule #13: Performance (JMH)
```java
@Benchmark public List<String> benchmarkAlgorithm() {
    return Algorithm.process(testData);
}
```

### Rule #14: Precise Timing (System.nanoTime())
```java
public static <T> TimingResult<T> measureExecution(Supplier<T> operation) {
    long start = System.nanoTime();
    T result = operation.get();
    return new TimingResult<>(result, System.nanoTime() - start);
}
```

### Rule #15: Secure ID (SecureRandom + UUID)
```java
@Test void shouldGenerateSecureUUIDs() {
    Set<UUID> ids = new HashSet<>();
    for (int i = 0; i < 10000; i++) {
        UUID id = UUID.randomUUID();
        assertEquals(4, id.version());
        assertFalse(ids.contains(id));
        ids.add(id);
    }
}
```

### Rule #16: Concurrency (ExecutorService + CompletableFuture)
```java
@Test void shouldHandleConcurrentOperations() throws InterruptedException {
    AtomicInteger counter = new AtomicInteger(0);
    ExecutorService executor = Executors.newFixedThreadPool(10);

    for (int i = 0; i < 10; i++) {
        executor.submit(() -> {
            for (int j = 0; j < 1000; j++) counter.incrementAndGet();
        });
    }

    executor.shutdown();
    executor.awaitTermination(10, TimeUnit.SECONDS);
    assertEquals(10000, counter.get());
}
```

## 🔧 COMMANDS
```yaml
commands:
  test: "mvn test | gradle test"
  coverage: "mvn jacoco:report | gradle jacocoTestReport"
  unit: "mvn test -Dgroups=unit"
  integration: "mvn test -Dgroups=integration"
  performance: "mvn exec:java -Dexec.mainClass=PerformanceBenchmark"
```

## 📊 CONFIG
```yaml
java_config:
  default_framework: "junit5"
  thresholds: { lines: 85, branches: 80, functions: 90 }
  performance_targets: { test_execution: "30s/100tests", detection: "300ms" }
```

---
**Status:** ✅ COMPLETE - Java Adapter | **Frameworks:** JUnit 5, TestNG, Maven/Gradle