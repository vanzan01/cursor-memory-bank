---
description: "Quality metrics and measurement system for Memory Bank refactoring"
globs: "**/refactoring/**", "**/quality/**", "**/metrics/**"
alwaysApply: false
---

# QUALITY METRICS FOR REFACTORING

> **TL;DR:** Comprehensive quality measurement system for Memory Bank refactoring, providing objective metrics to guide improvement decisions and validate refactoring outcomes.

## 📊 QUALITY METRICS OVERVIEW

Quality metrics provide objective measurements to assess Memory Bank system health, guide refactoring decisions, and validate improvement outcomes.

### Metric Categories

**Code Quality Metrics**
- Complexity measurements
- Maintainability indices
- Technical debt indicators
- Code coverage statistics

**System Quality Metrics**
- Performance benchmarks
- Reliability measurements
- Scalability indicators
- Security assessments

**Process Quality Metrics**
- Development velocity
- Defect rates
- Time to resolution
- User satisfaction scores

## 🔍 CODE QUALITY METRICS

### Complexity Measurements

**Cyclomatic Complexity**
```typescript
interface ComplexityMetrics {
  cyclomaticComplexity: number;    // Target: < 10 per function
  cognitiveComplexity: number;     // Target: < 15 per function
  nestingDepth: number;           // Target: < 4 levels
  linesOfCode: number;            // Target: < 50 per function
}

class ComplexityAnalyzer {
  analyzeFunction(functionCode: string): ComplexityMetrics {
    return {
      cyclomaticComplexity: this.calculateCyclomaticComplexity(functionCode),
      cognitiveComplexity: this.calculateCognitiveComplexity(functionCode),
      nestingDepth: this.calculateNestingDepth(functionCode),
      linesOfCode: this.countLinesOfCode(functionCode)
    };
  }

  private calculateCyclomaticComplexity(code: string): number {
    // Count decision points: if, while, for, case, catch, &&, ||
    const decisionPoints = [
      /\bif\b/g,
      /\bwhile\b/g,
      /\bfor\b/g,
      /\bcase\b/g,
      /\bcatch\b/g,
      /&&/g,
      /\|\|/g
    ];

    let complexity = 1; // Base complexity

    decisionPoints.forEach(pattern => {
      const matches = code.match(pattern);
      if (matches) {
        complexity += matches.length;
      }
    });

    return complexity;
  }

  generateComplexityReport(filePath: string): ComplexityReport {
    const functions = this.extractFunctions(filePath);
    const metrics = functions.map(func => ({
      name: func.name,
      metrics: this.analyzeFunction(func.code),
      location: func.location
    }));

    return {
      filePath,
      totalFunctions: functions.length,
      averageComplexity: this.calculateAverage(metrics, 'cyclomaticComplexity'),
      highComplexityFunctions: metrics.filter(m => m.metrics.cyclomaticComplexity > 10),
      recommendations: this.generateComplexityRecommendations(metrics)
    };
  }
}
```

**Maintainability Index**
```typescript
interface MaintainabilityMetrics {
  maintainabilityIndex: number;    // Target: > 70
  halsteadVolume: number;         // Measure of program size
  cyclomaticComplexity: number;   // Decision complexity
  linesOfCode: number;           // Physical size
  commentRatio: number;          // Target: > 0.2
}

class MaintainabilityAnalyzer {
  calculateMaintainabilityIndex(
    halsteadVolume: number,
    cyclomaticComplexity: number,
    linesOfCode: number,
    commentRatio: number
  ): number {
    // Microsoft's Maintainability Index formula
    const mi = Math.max(0,
      (171 - 5.2 * Math.log(halsteadVolume) -
       0.23 * cyclomaticComplexity -
       16.2 * Math.log(linesOfCode) +
       50 * Math.sin(Math.sqrt(2.4 * commentRatio))) * 100 / 171
    );

    return Math.round(mi);
  }

  analyzeMaintainability(filePath: string): MaintainabilityMetrics {
    const code = this.readFile(filePath);

    return {
      maintainabilityIndex: this.calculateMaintainabilityIndex(
        this.calculateHalsteadVolume(code),
        this.calculateCyclomaticComplexity(code),
        this.countLinesOfCode(code),
        this.calculateCommentRatio(code)
      ),
      halsteadVolume: this.calculateHalsteadVolume(code),
      cyclomaticComplexity: this.calculateCyclomaticComplexity(code),
      linesOfCode: this.countLinesOfCode(code),
      commentRatio: this.calculateCommentRatio(code)
    };
  }
}
```

### Technical Debt Metrics

**Debt Ratio Calculation**
```typescript
interface TechnicalDebtMetrics {
  debtRatio: number;              // Target: < 0.05 (5%)
  remedationTime: number;         // Hours to fix issues
  maintainabilityCost: number;    // Relative cost increase
  qualityGate: 'PASS' | 'WARN' | 'FAIL';
}

class TechnicalDebtAnalyzer {
  calculateDebtRatio(
    remedationTime: number,
    developmentTime: number
  ): number {
    return remedationTime / developmentTime;
  }

  analyzeProject(): TechnicalDebtMetrics {
    const issues = this.scanForIssues();
    const remedationTime = this.calculateRemediationTime(issues);
    const developmentTime = this.estimateDevelopmentTime();
    const debtRatio = this.calculateDebtRatio(remedationTime, developmentTime);

    return {
      debtRatio,
      remedationTime,
      maintainabilityCost: this.calculateMaintainabilityCost(debtRatio),
      qualityGate: this.determineQualityGate(debtRatio, issues)
    };
  }

  private determineQualityGate(
    debtRatio: number,
    issues: Issue[]
  ): 'PASS' | 'WARN' | 'FAIL' {
    const criticalIssues = issues.filter(i => i.severity === 'CRITICAL');

    if (criticalIssues.length > 0 || debtRatio > 0.1) {
      return 'FAIL';
    } else if (debtRatio > 0.05) {
      return 'WARN';
    } else {
      return 'PASS';
    }
  }
}
```

## 🚀 PERFORMANCE METRICS

### Response Time Measurements

**Performance Benchmarking**
```typescript
interface PerformanceMetrics {
  responseTime: {
    average: number;        // Target: < 100ms
    p95: number;           // Target: < 200ms
    p99: number;           // Target: < 500ms
  };
  throughput: number;      // Operations per second
  memoryUsage: number;     // MB
  cpuUtilization: number;  // Percentage
}

class PerformanceBenchmark {
  async measureOperation(operation: () => Promise<any>): Promise<PerformanceMetrics> {
    const measurements: number[] = [];
    const iterations = 100;

    // Warm up
    for (let i = 0; i < 10; i++) {
      await operation();
    }

    // Measure
    for (let i = 0; i < iterations; i++) {
      const start = performance.now();
      await operation();
      const end = performance.now();
      measurements.push(end - start);
    }

    return {
      responseTime: {
        average: this.calculateAverage(measurements),
        p95: this.calculatePercentile(measurements, 95),
        p99: this.calculatePercentile(measurements, 99)
      },
      throughput: 1000 / this.calculateAverage(measurements),
      memoryUsage: this.measureMemoryUsage(),
      cpuUtilization: this.measureCpuUtilization()
    };
  }

  async benchmarkMemoryBankOperations(): Promise<OperationBenchmarks> {
    return {
      taskCreation: await this.measureOperation(() => this.createTask()),
      taskUpdate: await this.measureOperation(() => this.updateTask()),
      modeTransition: await this.measureOperation(() => this.transitionMode()),
      fileOperations: await this.measureOperation(() => this.fileOperation()),
      configurationLoad: await this.measureOperation(() => this.loadConfiguration())
    };
  }
}
```

### Memory and Resource Metrics

**Resource Utilization Tracking**
```typescript
interface ResourceMetrics {
  memoryUsage: {
    heap: number;           // MB
    external: number;       // MB
    total: number;         // MB
  };
  fileSystemUsage: {
    diskSpace: number;      // MB
    fileCount: number;
    directoryCount: number;
  };
  networkUsage: {
    bytesIn: number;
    bytesOut: number;
    requestCount: number;
  };
}

class ResourceMonitor {
  getCurrentMetrics(): ResourceMetrics {
    const memUsage = process.memoryUsage();

    return {
      memoryUsage: {
        heap: Math.round(memUsage.heapUsed / 1024 / 1024),
        external: Math.round(memUsage.external / 1024 / 1024),
        total: Math.round(memUsage.rss / 1024 / 1024)
      },
      fileSystemUsage: this.measureFileSystemUsage(),
      networkUsage: this.measureNetworkUsage()
    };
  }

  startContinuousMonitoring(intervalMs: number = 5000): void {
    setInterval(() => {
      const metrics = this.getCurrentMetrics();
      this.logMetrics(metrics);
      this.checkThresholds(metrics);
    }, intervalMs);
  }

  private checkThresholds(metrics: ResourceMetrics): void {
    // Memory threshold: 500MB
    if (metrics.memoryUsage.total > 500) {
      console.warn(`High memory usage: ${metrics.memoryUsage.total}MB`);
    }

    // Disk space threshold: 1GB
    if (metrics.fileSystemUsage.diskSpace > 1000) {
      console.warn(`High disk usage: ${metrics.fileSystemUsage.diskSpace}MB`);
    }
  }
}
```

## 📈 QUALITY TRENDS ANALYSIS

### Historical Quality Tracking

**Quality Trend Monitoring**
```typescript
interface QualityTrend {
  timestamp: Date;
  metrics: QualitySnapshot;
  trend: 'IMPROVING' | 'STABLE' | 'DEGRADING';
  changeRate: number;
}

interface QualitySnapshot {
  codeQuality: number;        // 0-100 score
  performance: number;        // 0-100 score
  maintainability: number;    // 0-100 score
  testCoverage: number;       // 0-100 percentage
  technicalDebt: number;      // 0-100 score (inverted)
}

class QualityTrendAnalyzer {
  private history: QualitySnapshot[] = [];

  recordQualitySnapshot(): QualitySnapshot {
    const snapshot: QualitySnapshot = {
      codeQuality: this.calculateCodeQualityScore(),
      performance: this.calculatePerformanceScore(),
      maintainability: this.calculateMaintainabilityScore(),
      testCoverage: this.calculateTestCoverage(),
      technicalDebt: this.calculateTechnicalDebtScore()
    };

    this.history.push(snapshot);
    return snapshot;
  }

  analyzeTrends(period: number = 30): QualityTrend[] {
    const recentHistory = this.history.slice(-period);

    return recentHistory.map((snapshot, index) => {
      const previousSnapshot = index > 0 ? recentHistory[index - 1] : null;

      return {
        timestamp: new Date(),
        metrics: snapshot,
        trend: this.determineTrend(snapshot, previousSnapshot),
        changeRate: this.calculateChangeRate(snapshot, previousSnapshot)
      };
    });
  }

  generateQualityReport(): QualityReport {
    const currentSnapshot = this.recordQualitySnapshot();
    const trends = this.analyzeTrends();

    return {
      current: currentSnapshot,
      trends,
      recommendations: this.generateRecommendations(currentSnapshot, trends),
      qualityGate: this.evaluateQualityGate(currentSnapshot)
    };
  }

  private calculateCodeQualityScore(): number {
    // Composite score based on multiple factors
    const complexity = this.getAverageComplexity();
    const duplication = this.getCodeDuplication();
    const violations = this.getCodeViolations();

    return Math.max(0, 100 - complexity * 2 - duplication * 3 - violations * 5);
  }
}
```

### Refactoring Impact Assessment

**Before/After Comparison**
```typescript
interface RefactoringImpact {
  before: QualitySnapshot;
  after: QualitySnapshot;
  improvements: QualityImprovement[];
  regressions: QualityRegression[];
  overallImpact: 'POSITIVE' | 'NEUTRAL' | 'NEGATIVE';
  impactScore: number;
}

class RefactoringImpactAnalyzer {
  async assessRefactoringImpact(
    beforeSnapshot: QualitySnapshot,
    afterSnapshot: QualitySnapshot
  ): Promise<RefactoringImpact> {
    const improvements = this.identifyImprovements(beforeSnapshot, afterSnapshot);
    const regressions = this.identifyRegressions(beforeSnapshot, afterSnapshot);
    const impactScore = this.calculateImpactScore(improvements, regressions);

    return {
      before: beforeSnapshot,
      after: afterSnapshot,
      improvements,
      regressions,
      overallImpact: this.determineOverallImpact(impactScore),
      impactScore
    };
  }

  private identifyImprovements(
    before: QualitySnapshot,
    after: QualitySnapshot
  ): QualityImprovement[] {
    const improvements: QualityImprovement[] = [];

    Object.keys(before).forEach(metric => {
      const beforeValue = before[metric as keyof QualitySnapshot];
      const afterValue = after[metric as keyof QualitySnapshot];

      if (afterValue > beforeValue) {
        improvements.push({
          metric: metric as keyof QualitySnapshot,
          beforeValue,
          afterValue,
          improvement: afterValue - beforeValue,
          improvementPercentage: ((afterValue - beforeValue) / beforeValue) * 100
        });
      }
    });

    return improvements;
  }

  generateRefactoringReport(impact: RefactoringImpact): RefactoringReport {
    return {
      summary: {
        overallImpact: impact.overallImpact,
        impactScore: impact.impactScore,
        improvementCount: impact.improvements.length,
        regressionCount: impact.regressions.length
      },
      details: {
        improvements: impact.improvements,
        regressions: impact.regressions,
        recommendations: this.generateRefactoringRecommendations(impact)
      },
      metrics: {
        before: impact.before,
        after: impact.after,
        delta: this.calculateMetricDeltas(impact.before, impact.after)
      }
    };
  }
}
```

## 🎯 QUALITY GATES AND THRESHOLDS

### Quality Gate Configuration

**Configurable Quality Standards**
```yaml
# quality-gates.yaml
quality_gates:
  code_quality:
    maintainability_index:
      minimum: 70
      target: 85
    cyclomatic_complexity:
      maximum: 10
      target: 5
    code_coverage:
      minimum: 80
      target: 90
    duplication:
      maximum: 3
      target: 1

  performance:
    response_time:
      maximum: 200  # ms
      target: 100   # ms
    memory_usage:
      maximum: 500  # MB
      target: 200   # MB
    throughput:
      minimum: 100  # ops/sec
      target: 500   # ops/sec

  technical_debt:
    debt_ratio:
      maximum: 0.05  # 5%
      target: 0.02   # 2%
    critical_issues:
      maximum: 0
    high_issues:
      maximum: 5
      target: 0

  process:
    build_time:
      maximum: 300  # seconds
      target: 120   # seconds
    test_execution:
      maximum: 60   # seconds
      target: 30    # seconds
```

**Quality Gate Evaluation**
```typescript
class QualityGateEvaluator {
  private gates: QualityGateConfig;

  constructor(gateConfig: QualityGateConfig) {
    this.gates = gateConfig;
  }

  evaluateQualityGates(metrics: QualitySnapshot): QualityGateResult {
    const results: GateEvaluation[] = [];

    // Evaluate each gate
    Object.entries(this.gates).forEach(([category, gates]) => {
      Object.entries(gates).forEach(([metric, thresholds]) => {
        const value = this.getMetricValue(metrics, category, metric);
        const evaluation = this.evaluateGate(value, thresholds);

        results.push({
          category,
          metric,
          value,
          thresholds,
          status: evaluation.status,
          message: evaluation.message
        });
      });
    });

    return {
      overallStatus: this.determineOverallStatus(results),
      gateResults: results,
      passedGates: results.filter(r => r.status === 'PASS').length,
      totalGates: results.length,
      blockers: results.filter(r => r.status === 'FAIL'),
      warnings: results.filter(r => r.status === 'WARN')
    };
  }

  private evaluateGate(
    value: number,
    thresholds: QualityThreshold
  ): GateEvaluation {
    if (thresholds.maximum !== undefined && value > thresholds.maximum) {
      return {
        status: 'FAIL',
        message: `Value ${value} exceeds maximum threshold ${thresholds.maximum}`
      };
    }

    if (thresholds.minimum !== undefined && value < thresholds.minimum) {
      return {
        status: 'FAIL',
        message: `Value ${value} below minimum threshold ${thresholds.minimum}`
      };
    }

    if (thresholds.target !== undefined) {
      const targetMet = thresholds.maximum
        ? value <= thresholds.target
        : value >= thresholds.target;

      if (!targetMet) {
        return {
          status: 'WARN',
          message: `Value ${value} does not meet target ${thresholds.target}`
        };
      }
    }

    return {
      status: 'PASS',
      message: `Value ${value} meets all thresholds`
    };
  }
}
```

## 📊 METRICS DASHBOARD

### Real-Time Quality Dashboard

**Quality Metrics Visualization**
```typescript
interface QualityDashboard {
  overview: QualityOverview;
  trends: QualityTrend[];
  alerts: QualityAlert[];
  recommendations: QualityRecommendation[];
}

class QualityDashboardGenerator {
  generateDashboard(): QualityDashboard {
    const currentMetrics = this.getCurrentMetrics();
    const trends = this.getTrends();

    return {
      overview: {
        overallScore: this.calculateOverallScore(currentMetrics),
        qualityGate: this.evaluateQualityGate(currentMetrics),
        lastUpdated: new Date(),
        keyMetrics: {
          maintainability: currentMetrics.maintainability,
          performance: currentMetrics.performance,
          testCoverage: currentMetrics.testCoverage,
          technicalDebt: currentMetrics.technicalDebt
        }
      },
      trends: trends,
      alerts: this.generateAlerts(currentMetrics, trends),
      recommendations: this.generateRecommendations(currentMetrics, trends)
    };
  }

  exportMetricsReport(format: 'JSON' | 'CSV' | 'HTML'): string {
    const dashboard = this.generateDashboard();

    switch (format) {
      case 'JSON':
        return JSON.stringify(dashboard, null, 2);
      case 'CSV':
        return this.convertToCSV(dashboard);
      case 'HTML':
        return this.generateHTMLReport(dashboard);
      default:
        throw new Error(`Unsupported format: ${format}`);
    }
  }
}
```

This comprehensive quality metrics system provides objective measurements and actionable insights for Memory Bank refactoring and continuous improvement.
