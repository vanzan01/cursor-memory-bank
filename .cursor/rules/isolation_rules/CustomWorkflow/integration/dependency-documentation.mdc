---
description: "Dependency documentation methodology for Memory Bank development"
globs: "**/integration/**", "**/dependencies/**", "**/documentation/**"
alwaysApply: false
---

# DEPENDENCY DOCUMENTATION METHODOLOGY

> **TL;DR:** Comprehensive system for documenting, tracking, and managing dependencies in Memory Bank development to ensure system reliability and maintainability.

## 📋 DEPENDENCY OVERVIEW

Dependency documentation ensures clear understanding of system relationships, external dependencies, and integration requirements across all Memory Bank components.

### Dependency Categories

**System Dependencies**
- Operating system requirements
- Runtime environments (Node.js, Bun)
- Development tools (Git, IDE)
- Command-line utilities

**Package Dependencies**
- NPM/Bun packages
- Version constraints
- Security considerations
- License compatibility

**Internal Dependencies**
- Memory Bank mode dependencies
- File system dependencies
- Configuration dependencies
- Rule system dependencies

**External Dependencies**
- Third-party services
- API integrations
- Database systems
- Cloud services

## 📊 DEPENDENCY TRACKING SYSTEM

### Dependency Manifest

**package.json Enhancement**
```json
{
  "name": "cursor-memory-bank",
  "version": "1.0.0",
  "dependencies": {
    "@types/node": "^20.0.0",
    "yaml": "^2.3.0"
  },
  "devDependencies": {
    "bun-types": "latest",
    "@types/jest": "^29.0.0"
  },
  "memoryBankDependencies": {
    "systemRequirements": {
      "os": ["darwin", "linux", "win32"],
      "nodeVersion": ">=18.0.0",
      "bunVersion": ">=1.0.0",
      "gitVersion": ">=2.30.0"
    },
    "externalTools": {
      "cursor": {
        "required": true,
        "version": ">=0.30.0",
        "purpose": "Primary development environment"
      },
      "git": {
        "required": true,
        "version": ">=2.30.0",
        "purpose": "Version control and backup"
      }
    },
    "internalDependencies": {
      "modes": {
        "VAN": {
          "dependsOn": ["file-system", "task-management"],
          "provides": ["task-analysis", "complexity-detection"]
        },
        "PLAN": {
          "dependsOn": ["VAN", "configuration"],
          "provides": ["implementation-plan", "resource-estimation"]
        },
        "CREATIVE": {
          "dependsOn": ["PLAN", "archive-system"],
          "provides": ["design-decisions", "architecture-choices"]
        },
        "IMPLEMENT": {
          "dependsOn": ["PLAN", "CREATIVE", "git-integration"],
          "provides": ["code-implementation", "testing"]
        },
        "REFLECT": {
          "dependsOn": ["IMPLEMENT", "quality-metrics"],
          "provides": ["lessons-learned", "improvement-recommendations"]
        },
        "ARCHIVE": {
          "dependsOn": ["REFLECT", "documentation-system"],
          "provides": ["knowledge-preservation", "pattern-extraction"]
        }
      }
    }
  }
}
```

### Dependency Documentation Template

**System Dependency Documentation**
```yaml
# memory-bank/dependencies/system-dependencies.yaml
system_dependencies:
  operating_system:
    supported:
      - name: "macOS"
        versions: ["12.0+", "13.0+", "14.0+"]
        notes: "Primary development platform"
      - name: "Linux"
        versions: ["Ubuntu 20.04+", "Debian 11+"]
        notes: "Server deployment platform"
      - name: "Windows"
        versions: ["Windows 10+", "Windows 11"]
        notes: "Limited support, WSL recommended"

  runtime_environment:
    node_js:
      minimum_version: "18.0.0"
      recommended_version: "20.0.0"
      purpose: "JavaScript runtime for tooling"
      installation: "https://nodejs.org/"

    bun:
      minimum_version: "1.0.0"
      recommended_version: "latest"
      purpose: "Primary package manager and test runner"
      installation: "https://bun.sh/"

  development_tools:
    git:
      minimum_version: "2.30.0"
      purpose: "Version control and backup system"
      required_features: ["branch", "commit", "push", "pull"]

    cursor:
      minimum_version: "0.30.0"
      purpose: "Primary IDE with AI assistance"
      configuration: "memory-bank/.cursor/rules/"
```

**Package Dependency Documentation**
```yaml
# memory-bank/dependencies/package-dependencies.yaml
package_dependencies:
  production:
    yaml:
      version: "^2.3.0"
      purpose: "Configuration file parsing"
      security_notes: "Regular security updates required"
      alternatives: ["js-yaml", "toml"]

    "@types/node":
      version: "^20.0.0"
      purpose: "TypeScript definitions for Node.js"
      development_only: false

  development:
    bun-types:
      version: "latest"
      purpose: "TypeScript definitions for Bun"
      update_frequency: "monthly"

    "@types/jest":
      version: "^29.0.0"
      purpose: "TypeScript definitions for Jest testing"
      alternatives: ["@types/vitest"]

  optional:
    prettier:
      version: "^3.0.0"
      purpose: "Code formatting"
      configuration: ".prettierrc"

    eslint:
      version: "^8.0.0"
      purpose: "Code linting"
      configuration: ".eslintrc.js"
```

## 🔗 DEPENDENCY MAPPING

### Internal Dependency Graph

```mermaid
graph TD
    VAN["🔍 VAN Mode"] --> FileSystem["📁 File System"]
    VAN --> TaskMgmt["📋 Task Management"]

    PLAN["📋 PLAN Mode"] --> VAN
    PLAN --> Config["⚙️ Configuration"]

    CREATIVE["🎨 CREATIVE Mode"] --> PLAN
    CREATIVE --> Archive["📦 Archive System"]

    IMPLEMENT["⚒️ IMPLEMENT Mode"] --> PLAN
    IMPLEMENT --> CREATIVE
    IMPLEMENT --> Git["🔄 Git Integration"]

    REFLECT["🤔 REFLECT Mode"] --> IMPLEMENT
    REFLECT --> Metrics["📊 Quality Metrics"]

    ARCHIVE["📚 ARCHIVE Mode"] --> REFLECT
    ARCHIVE --> Docs["📝 Documentation"]

    FileSystem --> Config
    TaskMgmt --> FileSystem
    Git --> FileSystem
    Metrics --> TaskMgmt
    Docs --> Archive
```

### External Dependency Map

```mermaid
graph TD
    MemoryBank["🧠 Memory Bank"] --> Cursor["🖥️ Cursor IDE"]
    MemoryBank --> Git["🔄 Git"]
    MemoryBank --> Bun["🥟 Bun Runtime"]
    MemoryBank --> NodeJS["🟢 Node.js"]

    Cursor --> VSCode["📝 VS Code Engine"]
    Git --> GitHub["🐙 GitHub"]
    Bun --> V8["⚡ V8 Engine"]
    NodeJS --> V8

    MemoryBank --> FileSystem["📁 File System"]
    MemoryBank --> Terminal["💻 Terminal"]
    MemoryBank --> OS["🖥️ Operating System"]
```

## 📋 DEPENDENCY VALIDATION

### Automated Dependency Checks

**System Requirements Validation**
```typescript
// scripts/validate-dependencies.ts
import { execSync } from 'child_process';
import { readFileSync } from 'fs';
import { parse } from 'yaml';

interface SystemRequirements {
  nodeVersion: string;
  bunVersion: string;
  gitVersion: string;
  os: string[];
}

class DependencyValidator {
  async validateSystemRequirements(): Promise<ValidationResult> {
    const requirements = this.loadRequirements();
    const results: ValidationResult = {
      passed: [],
      failed: [],
      warnings: []
    };

    // Validate Node.js version
    try {
      const nodeVersion = execSync('node --version', { encoding: 'utf-8' }).trim();
      if (this.satisfiesVersion(nodeVersion, requirements.nodeVersion)) {
        results.passed.push(`Node.js ${nodeVersion} ✅`);
      } else {
        results.failed.push(`Node.js ${nodeVersion} does not satisfy ${requirements.nodeVersion}`);
      }
    } catch (error) {
      results.failed.push('Node.js not found');
    }

    // Validate Bun version
    try {
      const bunVersion = execSync('bun --version', { encoding: 'utf-8' }).trim();
      if (this.satisfiesVersion(bunVersion, requirements.bunVersion)) {
        results.passed.push(`Bun ${bunVersion} ✅`);
      } else {
        results.failed.push(`Bun ${bunVersion} does not satisfy ${requirements.bunVersion}`);
      }
    } catch (error) {
      results.failed.push('Bun not found');
    }

    // Validate Git version
    try {
      const gitVersion = execSync('git --version', { encoding: 'utf-8' }).trim();
      const version = gitVersion.match(/git version (\d+\.\d+\.\d+)/)?.[1];
      if (version && this.satisfiesVersion(version, requirements.gitVersion)) {
        results.passed.push(`Git ${version} ✅`);
      } else {
        results.failed.push(`Git ${version} does not satisfy ${requirements.gitVersion}`);
      }
    } catch (error) {
      results.failed.push('Git not found');
    }

    return results;
  }

  private loadRequirements(): SystemRequirements {
    const packageJson = JSON.parse(readFileSync('package.json', 'utf-8'));
    return packageJson.memoryBankDependencies.systemRequirements;
  }

  private satisfiesVersion(actual: string, required: string): boolean {
    // Implement semantic version comparison
    // This is a simplified version
    const actualParts = actual.replace(/^v/, '').split('.').map(Number);
    const requiredParts = required.replace(/>=/, '').split('.').map(Number);

    for (let i = 0; i < Math.max(actualParts.length, requiredParts.length); i++) {
      const actualPart = actualParts[i] || 0;
      const requiredPart = requiredParts[i] || 0;

      if (actualPart > requiredPart) return true;
      if (actualPart < requiredPart) return false;
    }

    return true;
  }
}
```

**Package Dependency Audit**
```bash
#!/bin/bash
# scripts/audit-dependencies.sh

echo "🔍 Memory Bank Dependency Audit"
echo "================================"

# Check for security vulnerabilities
echo "Checking for security vulnerabilities..."
bun audit

# Check for outdated packages
echo "Checking for outdated packages..."
bun outdated

# Validate package integrity
echo "Validating package integrity..."
bun install --frozen-lockfile

# Check license compatibility
echo "Checking license compatibility..."
bun run license-checker

# Generate dependency report
echo "Generating dependency report..."
bun run dependency-report > reports/dependency-audit-$(date +%Y-%m-%d).md

echo "✅ Dependency audit complete"
```

## 📊 DEPENDENCY MONITORING

### Continuous Monitoring

**Daily Dependency Checks**
```yaml
# .github/workflows/dependency-check.yml
name: Daily Dependency Check
on:
  schedule:
    - cron: '0 9 * * *'  # Daily at 9 AM UTC

jobs:
  dependency-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: oven-sh/setup-bun@v1

      - name: Install dependencies
        run: bun install

      - name: Run dependency validation
        run: bun run validate-dependencies

      - name: Security audit
        run: bun audit

      - name: Check for updates
        run: bun outdated

      - name: Generate report
        run: bun run dependency-report
```

**Dependency Update Strategy**
```yaml
# memory-bank/dependencies/update-strategy.yaml
update_strategy:
  security_updates:
    frequency: "immediate"
    auto_apply: true
    notification: "slack"

  minor_updates:
    frequency: "weekly"
    auto_apply: false
    review_required: true

  major_updates:
    frequency: "monthly"
    auto_apply: false
    testing_required: true
    approval_required: true

  monitoring:
    tools:
      - "dependabot"
      - "snyk"
      - "npm audit"

    alerts:
      - type: "security"
        severity: "high"
        action: "immediate"
      - type: "outdated"
        severity: "medium"
        action: "weekly_review"
```

## 🔧 DEPENDENCY MANAGEMENT TOOLS

### Custom Dependency Scripts

**Dependency Health Check**
```bash
#!/bin/bash
# scripts/dependency-health.sh

echo "🏥 Memory Bank Dependency Health Check"
echo "======================================"

# System dependencies
echo "1. System Dependencies:"
node --version && echo "  ✅ Node.js" || echo "  ❌ Node.js missing"
bun --version && echo "  ✅ Bun" || echo "  ❌ Bun missing"
git --version && echo "  ✅ Git" || echo "  ❌ Git missing"

# Package dependencies
echo "2. Package Dependencies:"
bun install --dry-run && echo "  ✅ All packages available" || echo "  ❌ Package issues detected"

# Internal dependencies
echo "3. Internal Dependencies:"
[ -f "memory-bank/tasks.md" ] && echo "  ✅ Task system" || echo "  ❌ Task system missing"
[ -f "memory-bank/config/system.yaml" ] && echo "  ✅ Configuration" || echo "  ❌ Configuration missing"
[ -d ".cursor/rules" ] && echo "  ✅ Rule system" || echo "  ❌ Rule system missing"

echo "✅ Health check complete"
```

**Dependency Update Assistant**
```typescript
// scripts/update-assistant.ts
class DependencyUpdateAssistant {
  async checkForUpdates(): Promise<UpdateReport> {
    const outdated = await this.getOutdatedPackages();
    const security = await this.getSecurityIssues();

    return {
      outdated,
      security,
      recommendations: this.generateRecommendations(outdated, security)
    };
  }

  async applyUpdates(updates: UpdateRequest[]): Promise<UpdateResult> {
    const results: UpdateResult = {
      successful: [],
      failed: [],
      skipped: []
    };

    for (const update of updates) {
      try {
        if (update.type === 'security') {
          await this.applySecurityUpdate(update);
          results.successful.push(update);
        } else if (update.approved) {
          await this.applyRegularUpdate(update);
          results.successful.push(update);
        } else {
          results.skipped.push(update);
        }
      } catch (error) {
        results.failed.push({ ...update, error: error.message });
      }
    }

    return results;
  }
}
```

This comprehensive dependency documentation system ensures reliable and maintainable Memory Bank operations with clear understanding of all system relationships and requirements.
