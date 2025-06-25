---
description: Optimized file verification
globs: file-verification.mdc
alwaysApply: false
---
# OPTIMIZED FILE VERIFICATION SYSTEM

> **TL;DR:** This system efficiently verifies and creates required Memory Bank file structures using batch operations and platform-optimized commands.

## 🔍 OPTIMIZED FILE VERIFICATION WORKFLOW

```mermaid
graph TD
    Start["Start File<br>Verification"] --> VerifyAll["Verify All<br>Required Components"]
    VerifyAll --> MissingCheck{"Missing<br>Components?"}
    MissingCheck -->|"Yes"| BatchCreate["Batch Create<br>All Missing Items"]
    MissingCheck -->|"No"| Complete["Verification<br>Complete"]
    BatchCreate --> Report["Generate<br>Verification Report"]
    Report --> Complete
```

## 📋 OPTIMIZED DIRECTORY CREATION

```mermaid
graph TD
    Start["Directory<br>Creation"] --> DetectOS["Detect Operating<br>System"]
    DetectOS -->|"Windows"| WinCmd["Batch Create<br>Windows Command"]
    DetectOS -->|"Mac/Linux"| UnixCmd["Batch Create<br>Unix Command"]
    WinCmd & UnixCmd --> Verify["Verify<br>Creation Success"]
    Verify --> Complete["Directory Setup<br>Complete"]
```

### Platform-Specific Commands

#### Windows (PowerShell)
```powershell
# Create all directories in one command
mkdir memory-bank, docs, docs\archive -ErrorAction SilentlyContinue

# Create all required files
$files = @(".cursorrules", "tasks.md", 
           "memory-bank\projectbrief.md", 
           "memory-bank\productContext.md",
           "memory-bank\systemPatterns.md",
           "memory-bank\techContext.md",
           "memory-bank\activeContext.md",
           "memory-bank\progress.md")

foreach ($file in $files) {
    if (-not (Test-Path $file)) {
        New-Item -Path $file -ItemType File -Force
    }
}
```

#### Mac/Linux (Bash)
```bash
# Create all directories in one command
mkdir -p memory-bank docs/archive

# Create all required files
touch .cursorrules tasks.md \
      memory-bank/projectbrief.md \
      memory-bank/productContext.md \
      memory-bank/systemPatterns.md \
      memory-bank/techContext.md \
      memory-bank/activeContext.md \
      memory-bank/progress.md
```

## 📝 STREAMLINED VERIFICATION PROCESS

Instead of checking each component separately, perform batch verification:

```powershell
# Windows - PowerShell
$requiredDirs = @("memory-bank", "docs", "docs\archive")
$requiredFiles = @(".cursorrules", "tasks.md")
$mbFiles = @("projectbrief.md", "productContext.md", "systemPatterns.md", 
             "techContext.md", "activeContext.md", "progress.md")

$missingDirs = $requiredDirs | Where-Object { -not (Test-Path $_) -or -not (Test-Path $_ -PathType Container) }
$missingFiles = $requiredFiles | Where-Object { -not (Test-Path $_) -or (Test-Path $_ -PathType Container) }
$missingMBFiles = $mbFiles | ForEach-Object { "memory-bank\$_" } | 
                  Where-Object { -not (Test-Path $_) -or (Test-Path $_ -PathType Container) }

if ($missingDirs.Count -eq 0 -and $missingFiles.Count -eq 0 -and $missingMBFiles.Count -eq 0) {
    Write-Output "✓ All required components verified"
} else {
    # Create all missing items at once
    if ($missingDirs.Count -gt 0) {
        $missingDirs | ForEach-Object { mkdir $_ -Force }
    }
    if ($missingFiles.Count -gt 0 -or $missingMBFiles.Count -gt 0) {
        $allMissingFiles = $missingFiles + $missingMBFiles
        $allMissingFiles | ForEach-Object { New-Item -Path $_ -ItemType File -Force }
    }
}
```

## 📝 TEMPLATE INITIALIZATION

Optimize template creation with a single script:

```powershell
# Windows - PowerShell
$templates = @{
    "tasks.md" = @"
# Memory Bank: Tasks

## Current Task
[Task not yet defined]

## Status
- [ ] Task definition
- [ ] Implementation plan
- [ ] Execution
- [ ] Documentation

## Requirements
[No requirements defined yet]
"@

    "memory-bank\activeContext.md" = @"
# Memory Bank: Active Context

## Current Focus
[No active focus defined]

## Status
[No status defined]

## Latest Changes
[No changes recorded]
"@

    # Add other templates here
}

foreach ($file in $templates.Keys) {
    if (Test-Path $file) {
        Set-Content -Path $file -Value $templates[$file]
    }
}
```

## 🔍 PERFORMANCE OPTIMIZATION BEST PRACTICES

1. **Batch Operations**: Always use batch operations instead of individual commands
   ```
   # GOOD: Create all directories at once
   mkdir memory-bank docs docs\archive
   
   # BAD: Create directories one at a time
   mkdir memory-bank
   mkdir docs
   mkdir docs\archive
   ```

2. **Pre-Check Optimization**: Check all requirements first, then create only what's missing
   ```
   # First check what's missing
   $missingItems = ...
   
   # Then create only what's missing
   if ($missingItems) { ... }
   ```

3. **Error Handling**: Include error handling in all commands
   ```
   mkdir memory-bank, docs, docs\archive -ErrorAction SilentlyContinue
   ```

4. **Platform Adaptation**: Auto-detect platform and use appropriate commands
   ```
   if ($IsWindows) {
       # Windows commands
   } else {
       # Unix commands
   }
   ```

5. **One-Pass Verification**: Verify directory structure in a single pass
   ```
   $requiredPaths = @("memory-bank", "docs", "docs\archive", ".cursorrules", "tasks.md")
   $missingPaths = $requiredPaths | Where-Object { -not (Test-Path $_) }
   ```

## 📝 VERIFICATION REPORT FORMAT

```
✅ VERIFICATION COMPLETE
- Created directories: [list]
- Created files: [list]
- All components verified

Memory Bank system ready for use.
``` 