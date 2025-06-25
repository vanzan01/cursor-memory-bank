---
description: "Performance testing rules and methodologies for Memory Bank development"
globs: "**/testing/**", "**/performance/**", "**/benchmark/**"
alwaysApply: false
---

# PERFORMANCE TESTING METHODOLOGY

> **TL;DR:** Comprehensive performance testing approach for Memory Bank development, ensuring optimal system performance and identifying bottlenecks early.

```mermaid
graph TD
    Start["⚡ PERFORMANCE TESTING"] --> Baseline["📊 Establish Baseline"]
    Baseline --> Identify["🎯 Identify Test Scenarios"]
    Identify --> Design["📋 Design Performance Tests"]
    Design --> Execute["🚀 Execute Tests"]
    Execute --> Analyze["📈 Analyze Results"]
    Analyze --> Optimize["🔧 Optimize Performance"]
    Optimize --> Verify["✅ Verify Improvements"]
    Verify --> Document["📝 Document Results"]

    style Start fill:#d971ff,stroke:#a33bc2,color:white
    style Baseline fill:#4da6ff,stroke:#0066cc,color:white
    style Optimize fill:#4dbb5f,stroke:#36873f,color:white
    style Document fill:#ffa64d,stroke:#cc7a30,color:white
```

## PERFORMANCE TESTING STRATEGY

### Test Categories:
1. **Load Testing**: Normal expected load
2. **Stress Testing**: Beyond normal capacity
3. **Spike Testing**: Sudden load increases
4. **Volume Testing**: Large amounts of data
5. **Endurance Testing**: Extended periods

### Key Metrics:
- **Response Time**: Request processing time
- **Throughput**: Requests per second
- **Resource Usage**: CPU, memory, disk I/O
- **Error Rate**: Failed requests percentage
- **Scalability**: Performance under load

## BUN TESTING INTEGRATION

### Bun Performance Features:
```javascript
// Performance timing with Bun
import { performance } from "perf_hooks";

test("performance benchmark", async () => {
  const start = performance.now();
  await performOperation();
  const end = performance.now();

  expect(end - start).toBeLessThan(100); // 100ms threshold
});
```

### Memory Usage Testing:
```javascript
// Memory usage monitoring
test("memory usage", () => {
  const initialMemory = process.memoryUsage();
  performMemoryIntensiveOperation();
  const finalMemory = process.memoryUsage();

  const memoryIncrease = finalMemory.heapUsed - initialMemory.heapUsed;
  expect(memoryIncrease).toBeLessThan(10 * 1024 * 1024); // 10MB limit
});
```

## VERIFICATION CHECKLIST

```
✓ PERFORMANCE TESTING CHECKLIST
- Baseline performance established? [YES/NO]
- Test scenarios identified and documented? [YES/NO]
- Performance tests implemented? [YES/NO]
- Tests executed successfully? [YES/NO]
- Results analyzed and documented? [YES/NO]
- Performance bottlenecks identified? [YES/NO]
- Optimizations implemented if needed? [YES/NO]
- Performance improvements verified? [YES/NO]

→ If all YES: Performance testing complete
→ If any NO: Continue performance testing process
```

This methodology ensures systematic performance testing and optimization for Memory Bank components.