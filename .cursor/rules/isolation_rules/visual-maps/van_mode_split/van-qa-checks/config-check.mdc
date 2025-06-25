---
description: Process map for VAN QA configuration validation
globs: van-qa-checks/config-check.mdc
alwaysApply: false
---
# VAN QA: CONFIGURATION VALIDATION

> **TL;DR:** This component validates configuration files for proper syntax and compatibility with the project and platform.

## 2️⃣ CONFIGURATION VALIDATION PROCESS

```mermaid
graph TD
    Start["Configuration Validation"] --> IdentifyConfigs["Identify Configuration<br>Files"]
    IdentifyConfigs --> ReadConfigs["Read Configuration<br>Files"]
    ReadConfigs --> ValidateSyntax["Validate Syntax<br>and Format"]
    ValidateSyntax --> SyntaxStatus{"Syntax<br>Valid?"}
    
    SyntaxStatus -->|"Yes"| CheckCompatibility["Check Compatibility<br>with Platform"]
    SyntaxStatus -->|"No"| FixSyntax["Fix Syntax<br>Errors"]
    FixSyntax --> RetryValidate["Retry Validation"]
    RetryValidate --> SyntaxStatus
    
    CheckCompatibility --> CompatStatus{"Compatible with<br>Platform?"}
    CompatStatus -->|"Yes"| ConfigSuccess["Configurations Validated<br>✅ PASS"]
    CompatStatus -->|"No"| AdaptConfigs["Adapt Configurations<br>for Platform"]
    AdaptConfigs --> RetryCompat["Retry Compatibility<br>Check"]
    RetryCompat --> CompatStatus
    
    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style ConfigSuccess fill:#10b981,stroke:#059669,color:white
    style SyntaxStatus fill:#f6546a,stroke:#c30052,color:white
    style CompatStatus fill:#f6546a,stroke:#c30052,color:white
```

### Configuration Validation Implementation:
```powershell
# Example: Validate configuration files for a web project
function Validate-Configurations {
    $configFiles = @(
        "package.json",
        "tsconfig.json",
        "vite.config.js"
    )
    
    $invalidConfigs = @()
    $incompatibleConfigs = @()
    
    foreach ($configFile in $configFiles) {
        if (Test-Path $configFile) {
            # Check JSON syntax for JSON files
            if ($configFile -match "\.json$") {
                try {
                    Get-Content $configFile -Raw | ConvertFrom-Json | Out-Null
                } catch {
                    $invalidConfigs += "$configFile (JSON syntax error: $($_.Exception.Message))"
                    continue
                }
            }
            
            # Specific configuration compatibility checks
            if ($configFile -eq "vite.config.js") {
                $content = Get-Content $configFile -Raw
                # Check for React plugin in Vite config
                if ($content -notmatch "react\(\)") {
                    $incompatibleConfigs += "$configFile (Missing React plugin for React project)"
                }
            }
        } else {
            $invalidConfigs += "$configFile (file not found)"
        }
    }
    
    # Display results
    if ($invalidConfigs.Count -eq 0 -and $incompatibleConfigs.Count -eq 0) {
        Write-Output "✅ All configurations validated and compatible"
        return $true
    } else {
        if ($invalidConfigs.Count -gt 0) {
            Write-Output "❌ Invalid configurations: $($invalidConfigs -join ', ')"
        }
        if ($incompatibleConfigs.Count -gt 0) {
            Write-Output "❌ Incompatible configurations: $($incompatibleConfigs -join ', ')"
        }
        return $false
    }
}
```

## 📋 CONFIGURATION VALIDATION CHECKPOINT

```
✓ CHECKPOINT: CONFIGURATION VALIDATION
- All configuration files found? [YES/NO]
- All configuration syntax valid? [YES/NO]
- All configurations compatible with platform? [YES/NO]

→ If all YES: Continue to Environment Validation.
→ If any NO: Fix configuration issues before continuing.
```

**Next Step (on PASS):** Load `van-qa-checks/environment-check.mdc`.
**Next Step (on FAIL):** Check `van-qa-utils/common-fixes.mdc` for configuration fixes. 