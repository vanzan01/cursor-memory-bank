---
description: Utility for VAN QA common validation fixes
globs: van-qa-utils/common-fixes.mdc
alwaysApply: false
---
# VAN QA: COMMON VALIDATION FIXES

> **TL;DR:** This component provides common fixes for issues that may arise during the QA validation process.

## 🧪 COMMON QA VALIDATION FIXES BY CATEGORY

### Dependency Issues

| Issue | Fix |
|-------|-----|
| **Missing Node.js** | Download and install Node.js from https://nodejs.org/ |
| **Outdated npm** | Run `npm install -g npm@latest` to update |
| **Missing packages** | Run `npm install` or `npm install [package-name]` |
| **Package version conflicts** | Adjust versions in package.json and run `npm install` |
| **Dependency resolution issues** | Run `npm cache clean -f` and try installing again |

### Configuration Issues

| Issue | Fix |
|-------|-----|
| **Invalid JSON** | Use a JSON validator (e.g., jsonlint) to check syntax |
| **Missing React plugin** | Add `import react from '@vitejs/plugin-react'` and `plugins: [react()]` to vite.config.js |
| **Incompatible TypeScript config** | Update `tsconfig.json` with correct React settings |
| **Mismatched version references** | Ensure consistent versions across configuration files |
| **Missing entries in config files** | Add required fields to configuration files |

### Environment Issues

| Issue | Fix |
|-------|-----|
| **Permission denied** | Run terminal as administrator (Windows) or use sudo (Mac/Linux) |
| **Port already in use** | Kill process using the port: `netstat -ano \| findstr :PORT` then `taskkill /F /PID PID` (Windows) or `lsof -i :PORT` then `kill -9 PID` (Mac/Linux) |
| **Missing build tools** | Install required command-line tools (git, node, etc.) |
| **Environment variable issues** | Set required environment variables: `$env:VAR_NAME = "value"` (PowerShell) or `export VAR_NAME="value"` (Bash) |
| **Disk space issues** | Free up disk space, clean npm/package cache files |

### Build Test Issues

| Issue | Fix |
|-------|-----|
| **Build fails** | Check console for specific error messages |
| **Test fails** | Verify minimal configuration is correct |
| **Path issues** | Ensure paths use correct separators for the platform (`\` for Windows, `/` for Mac/Linux) |
| **Missing dependencies** | Make sure all required dependencies are installed |
| **Script permissions** | Ensure script files have execution permissions (chmod +x on Unix) |

## 📝 ISSUE DIAGNOSIS PROCEDURES

### 1. Dependency Diagnosis
```powershell
# Find conflicting dependencies
npm ls [package-name]

# Check for outdated packages
npm outdated

# Check for vulnerabilities
npm audit
```

### 2. Configuration Diagnosis
```powershell
# List all configuration files
Get-ChildItem -Recurse -Include "*.json","*.config.js" | Select-Object FullName

# Find missing references in tsconfig.json
if (Test-Path "tsconfig.json") { 
    $tsconfig = Get-Content "tsconfig.json" -Raw | ConvertFrom-Json
    if (-not $tsconfig.compilerOptions.jsx) {
        Write-Output "Missing jsx setting in tsconfig.json"
    }
}
```

### 3. Environment Diagnosis
```powershell
# Check process using a port (Windows)
netstat -ano | findstr ":3000"

# List environment variables
Get-ChildItem Env:

# Check disk space
Get-PSDrive C | Select-Object Used,Free
```

**Next Step:** Return to the validation process or follow the specific fix recommendations provided above. 