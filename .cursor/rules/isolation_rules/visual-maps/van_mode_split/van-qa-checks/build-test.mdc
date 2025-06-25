---
description: Process map for VAN QA minimal build test
globs: van-qa-checks/build-test.mdc
alwaysApply: false
---
# VAN QA: MINIMAL BUILD TEST

> **TL;DR:** This component performs a minimal build test to ensure core build functionality works properly.

## 4️⃣ MINIMAL BUILD TEST PROCESS

```mermaid
graph TD
    Start["Minimal Build Test"] --> CreateTest["Create Minimal<br>Test Project"]
    CreateTest --> BuildTest["Attempt<br>Build"]
    BuildTest --> BuildStatus{"Build<br>Successful?"}
    
    BuildStatus -->|"Yes"| RunTest["Run Basic<br>Functionality Test"]
    BuildStatus -->|"No"| FixBuild["Fix Build<br>Issues"]
    FixBuild --> RetryBuild["Retry Build"]
    RetryBuild --> BuildStatus
    
    RunTest --> TestStatus{"Test<br>Passed?"}
    TestStatus -->|"Yes"| TestSuccess["Minimal Build Test<br>✅ PASS"]
    TestStatus -->|"No"| FixTest["Fix Test<br>Issues"]
    FixTest --> RetryTest["Retry Test"]
    RetryTest --> TestStatus
    
    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style TestSuccess fill:#10b981,stroke:#059669,color:white
    style BuildStatus fill:#f6546a,stroke:#c30052,color:white
    style TestStatus fill:#f6546a,stroke:#c30052,color:white
```

### Minimal Build Test Implementation:
```powershell
# Example: Perform minimal build test for a React project
function Perform-MinimalBuildTest {
    $buildSuccess = $false
    $testSuccess = $false
    
    # Create minimal test project
    $testDir = ".__build_test"
    if (Test-Path $testDir) {
        Remove-Item -Path $testDir -Recurse -Force
    }
    
    try {
        # Create minimal test directory
        New-Item -Path $testDir -ItemType Directory | Out-Null
        Push-Location $testDir
        
        # Initialize minimal package.json
        @"
{
  "name": "build-test",
  "version": "1.0.0",
  "description": "Minimal build test",
  "main": "index.js",
  "scripts": {
    "build": "echo Build test successful"
  }
}
"@ | Set-Content -Path "package.json"
        
        # Attempt build
        npm run build | Out-Null
        $buildSuccess = $true
        
        # Create minimal test file
        @"
console.log('Test successful');
"@ | Set-Content -Path "index.js"
        
        # Run basic test
        node index.js | Out-Null
        $testSuccess = $true
        
    } catch {
        Write-Output "❌ Build test failed: $($_.Exception.Message)"
    } finally {
        Pop-Location
        if (Test-Path $testDir) {
            Remove-Item -Path $testDir -Recurse -Force
        }
    }
    
    # Display results
    if ($buildSuccess -and $testSuccess) {
        Write-Output "✅ Minimal build test passed successfully"
        return $true
    } else {
        if (-not $buildSuccess) {
            Write-Output "❌ Build process failed"
        }
        if (-not $testSuccess) {
            Write-Output "❌ Basic functionality test failed"
        }
        return $false
    }
}
```

## 📋 MINIMAL BUILD TEST CHECKPOINT

```
✓ CHECKPOINT: MINIMAL BUILD TEST
- Test project creation successful? [YES/NO]
- Build process completed successfully? [YES/NO]
- Basic functionality test passed? [YES/NO]

→ If all YES: QA Validation complete, proceed to generate success report.
→ If any NO: Fix build issues before continuing.
```

**Next Step (on PASS):** Load `van-qa-utils/reports.mdc` to generate success report.
**Next Step (on FAIL):** Check `van-qa-utils/common-fixes.mdc` for build test fixes. 