# Troubleshooting Guide

> **Comprehensive solutions for common Cursor Memory Bank issues**

This guide provides detailed solutions for the most common issues you might encounter while using Cursor Memory Bank, organized by category with step-by-step resolution instructions.

## 🚨 Quick Diagnostic Checklist

Before diving into specific issues, run this quick diagnostic:

```bash
# 1. Verify basic installation
ls -la memory-bank/
ls -la .cursor/

# 2. Check file permissions
find memory-bank/ -type f -name "*.md" | head -5
find .cursor/ -type f -name "*.mdc" | head -5

# 3. Test Cursor integration
grep -r "Memory Bank" memory-bank/ | wc -l
```

**Expected Results:**
- ✅ Both directories exist and are accessible
- ✅ Files are readable and writable
- ✅ Memory Bank content is found in files

## 🔧 Installation Issues

### Issue 1: Repository Clone Fails

**Symptoms:**
```
fatal: repository 'https://github.com/...' not found
Permission denied (publickey)
```

**Solutions:**

#### For HTTPS Clone Issues:
```bash
# Use HTTPS instead of SSH
git clone https://github.com/your-username/cursor-memory-bank.git

# If still failing, check internet connection
ping github.com

# Try with verbose output
git clone --verbose https://github.com/your-username/cursor-memory-bank.git
```

#### For SSH Key Issues:
```bash
# Check SSH key
ssh -T git@github.com

# Generate new SSH key if needed
ssh-keygen -t ed25519 -C "your_email@example.com"

# Add to SSH agent
ssh-add ~/.ssh/id_ed25519
```

#### Alternative: Download ZIP
```bash
# If git clone continues to fail
curl -L https://github.com/your-username/cursor-memory-bank/archive/main.zip -o memory-bank.zip
unzip memory-bank.zip
mv cursor-memory-bank-main cursor-memory-bank
```

### Issue 2: Missing Directories After Installation

**Symptoms:**
```
ls: cannot access 'memory-bank/': No such file or directory
ls: cannot access '.cursor/': No such file or directory
```

**Solutions:**

#### Check Current Directory:
```bash
# Verify you're in the right place
pwd
ls -la

# Look for the project directory
find . -name "memory-bank" -type d 2>/dev/null
find . -name ".cursor" -type d 2>/dev/null
```

#### Navigate to Correct Directory:
```bash
# If you find the directories elsewhere
cd path/to/cursor-memory-bank

# Verify structure
ls -la memory-bank/
ls -la .cursor/
```

#### Recreate Missing Directories:
```bash
# If directories are truly missing, recreate them
mkdir -p memory-bank
mkdir -p .cursor/rules

# Download missing files
curl -L https://raw.githubusercontent.com/your-username/cursor-memory-bank/main/memory-bank/tasks.md -o memory-bank/tasks.md
```

### Issue 3: Permission Denied Errors

**Symptoms:**
```
Permission denied: memory-bank/tasks.md
chmod: cannot access '.cursor/': Permission denied
```

**Solutions:**

#### For macOS/Linux:
```bash
# Fix ownership
sudo chown -R $USER:$USER .

# Fix permissions
chmod -R 755 .cursor/
chmod -R 644 memory-bank/*.md

# Verify permissions
ls -la memory-bank/
ls -la .cursor/
```

#### For Windows:
```powershell
# Run PowerShell as Administrator
# Take ownership of files
takeown /f . /r /d y

# Grant full control
icacls . /grant %USERNAME%:F /t
```

## 🎯 Cursor IDE Integration Issues

### Issue 4: Cursor Doesn't Recognize Memory Bank

**Symptoms:**
- AI assistant doesn't suggest Memory Bank workflows
- No response when typing "VAN", "PLAN", etc.
- Rules don't seem to be loaded

**Solutions:**

#### Step 1: Verify Cursor Installation
```bash
# Check Cursor version
cursor --version

# Update if needed (download from cursor.sh)
```

#### Step 2: Check Project Opening Method
```bash
# Open project correctly
cd cursor-memory-bank
cursor .

# Alternative: Use GUI
# File → Open Folder → Select cursor-memory-bank directory
```

#### Step 3: Verify Rules Directory
```bash
# Check rules exist
find .cursor -name "*.mdc" | head -10

# Verify rule content
head -20 .cursor/rules/isolation_rules/main.mdc
```

#### Step 4: Restart Cursor
1. Close Cursor completely
2. Reopen the project
3. Wait for full initialization
4. Test by typing "VAN" in any file

### Issue 5: Memory Bank Modes Not Working

**Symptoms:**
- Typing mode names (VAN, PLAN, etc.) has no effect
- No guided workflows appear
- AI doesn't follow Memory Bank patterns

**Solutions:**

#### Check Rule Loading:
```bash
# Verify rule files are accessible
ls -la .cursor/rules/isolation_rules/

# Check for syntax errors in rules
grep -n "ERROR\|error" .cursor/rules/isolation_rules/*.mdc
```

#### Test Individual Components:
```bash
# Test if Cursor reads .cursor directory
echo "Test rule" > .cursor/test.md
# Open in Cursor and see if it's recognized

# Remove test file
rm .cursor/test.md
```

#### Reset Cursor Configuration:
1. Close Cursor
2. Clear Cursor cache (location varies by OS):
   - **macOS**: `~/Library/Application Support/Cursor`
   - **Windows**: `%APPDATA%\Cursor`
   - **Linux**: `~/.config/Cursor`
3. Reopen project

### Issue 6: AI Assistant Not Responding to Memory Bank Commands

**Symptoms:**
- AI responds normally but ignores Memory Bank context
- No mode transitions occur
- Generic responses instead of Memory Bank workflows

**Solutions:**

#### Verify AI Model Access:
1. Check Cursor AI settings
2. Ensure you have an active subscription/credits
3. Test with simple AI queries first

#### Check Context Loading:
```bash
# Verify Memory Bank files have content
wc -l memory-bank/*.md

# Check for empty or corrupted files
file memory-bank/*.md
```

#### Force Context Refresh:
1. Edit and save a Memory Bank file
2. Type mode command immediately after
3. Wait for AI processing

## 📁 File System Issues

### Issue 7: Memory Bank Files Not Updating

**Symptoms:**
- `tasks.md` doesn't reflect changes
- Progress tracking appears frozen
- Manual edits don't persist

**Solutions:**

#### Check File Locks:
```bash
# Check if files are locked (macOS/Linux)
lsof memory-bank/tasks.md

# For Windows, check file properties for read-only status
```

#### Verify File Integrity:
```bash
# Check file encoding
file memory-bank/tasks.md

# Verify file isn't corrupted
head -10 memory-bank/tasks.md
tail -10 memory-bank/tasks.md
```

#### Force File Refresh:
```bash
# Create backup
cp memory-bank/tasks.md memory-bank/tasks.md.backup

# Test write access
echo "# Test" >> memory-bank/tasks.md

# Restore if needed
mv memory-bank/tasks.md.backup memory-bank/tasks.md
```

### Issue 8: Slow Performance or High Memory Usage

**Symptoms:**
- Cursor becomes sluggish when Memory Bank is active
- High CPU/memory usage
- Long delays in AI responses

**Solutions:**

#### Check Project Size:
```bash
# Check total project size
du -sh .

# Check Memory Bank size specifically
du -sh memory-bank/
du -sh .cursor/

# Find large files
find . -size +10M -type f
```

#### Optimize File Structure:
```bash
# Archive old projects
mkdir archive
mv old-project-* archive/

# Clean up temporary files
find . -name "*.tmp" -delete
find . -name ".DS_Store" -delete
```

#### Reduce Rule Complexity:
```bash
# Check rule file sizes
ls -lah .cursor/rules/isolation_rules/

# Temporarily disable complex rules by renaming
mv .cursor/rules/isolation_rules/complex-rule.mdc .cursor/rules/isolation_rules/complex-rule.mdc.disabled
```

## 🌐 Platform-Specific Issues

### Windows-Specific Issues

#### Issue 9: PowerShell Execution Policy

**Symptoms:**
```
execution of scripts is disabled on this system
```

**Solution:**
```powershell
# Set execution policy for current user
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Verify change
Get-ExecutionPolicy -List
```

#### Issue 10: Path Length Limitations

**Symptoms:**
```
The specified path, file name, or both are too long
```

**Solutions:**
```powershell
# Enable long path support (Windows 10 v1607+)
# Run as Administrator
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force

# Alternative: Move project closer to root
move C:\very\long\path\cursor-memory-bank C:\cmb
```

#### Issue 11: Windows Defender Interference

**Symptoms:**
- Slow file access
- Files temporarily disappearing
- Cursor crashes during file operations

**Solution:**
1. Open Windows Defender Security Center
2. Go to Virus & threat protection
3. Add exclusion for cursor-memory-bank directory
4. Restart Cursor

### macOS-Specific Issues

#### Issue 12: Gatekeeper Blocking Cursor

**Symptoms:**
```
"Cursor" cannot be opened because the developer cannot be verified
```

**Solution:**
1. System Preferences → Security & Privacy
2. Click "Open Anyway" for Cursor
3. Or disable Gatekeeper temporarily:
```bash
sudo spctl --master-disable
# Re-enable after installation:
sudo spctl --master-enable
```

#### Issue 13: Spotlight Indexing Interference

**Symptoms:**
- High CPU usage
- Slow file operations
- System becomes unresponsive

**Solution:**
```bash
# Exclude project from Spotlight indexing
touch .metadata_never_index

# Or add to Spotlight privacy settings:
# System Preferences → Spotlight → Privacy → Add cursor-memory-bank folder
```

### Linux-Specific Issues

#### Issue 14: Missing Dependencies

**Symptoms:**
```
command not found: cursor
git: command not found
```

**Solutions:**

#### For Ubuntu/Debian:
```bash
# Update package list
sudo apt update

# Install essential tools
sudo apt install git curl wget

# Install Cursor (download from cursor.sh)
wget https://download.cursor.sh/linux/appImage/x64
chmod +x cursor-*.AppImage
sudo mv cursor-*.AppImage /usr/local/bin/cursor
```

#### For CentOS/RHEL:
```bash
# Install essential tools
sudo yum install git curl wget

# Or for newer versions:
sudo dnf install git curl wget
```

#### Issue 15: File System Permissions

**Symptoms:**
```
Operation not permitted
Cannot create directory
```

**Solution:**
```bash
# Check available space
df -h

# Check inode usage
df -i

# Fix permissions
sudo chown -R $USER:$USER $HOME/cursor-memory-bank
chmod -R 755 $HOME/cursor-memory-bank
```

## 🔍 Advanced Troubleshooting

### Issue 16: Memory Bank State Corruption

**Symptoms:**
- Inconsistent behavior across sessions
- Mode transitions fail randomly
- Context appears lost between operations

**Diagnostic Steps:**
```bash
# Check for file corruption
find memory-bank/ -name "*.md" -exec file {} \;

# Verify JSON-like structures in files
grep -n "^\s*{" memory-bank/*.md
grep -n "^\s*}" memory-bank/*.md

# Check for encoding issues
file -bi memory-bank/*.md
```

**Recovery Steps:**
```bash
# Create backup
cp -r memory-bank memory-bank-backup-$(date +%Y%m%d)

# Reset to clean state
git checkout HEAD -- memory-bank/

# Or restore from backup if available
cp -r memory-bank-backup-YYYYMMDD memory-bank
```

### Issue 17: Rule Conflicts

**Symptoms:**
- Unexpected AI behavior
- Conflicting suggestions
- Mode transitions to wrong states

**Diagnostic Steps:**
```bash
# Check for duplicate rules
find .cursor -name "*.mdc" -exec basename {} \; | sort | uniq -d

# Look for conflicting patterns
grep -r "VAN\|PLAN\|CREATIVE\|IMPLEMENT" .cursor/rules/
```

**Resolution:**
```bash
# Temporarily disable custom rules
mkdir .cursor/rules-disabled
mv .cursor/rules/custom-* .cursor/rules-disabled/

# Test with core rules only
# Re-enable rules one by one to identify conflicts
```

## 📞 Getting Additional Help

### Before Seeking Help

Run this comprehensive diagnostic and include the output:

```bash
#!/bin/bash
echo "=== Cursor Memory Bank Diagnostic Report ==="
echo "Date: $(date)"
echo "OS: $(uname -a)"
echo "PWD: $(pwd)"
echo ""

echo "=== Directory Structure ==="
ls -la memory-bank/ 2>&1
ls -la .cursor/ 2>&1
echo ""

echo "=== File Permissions ==="
ls -la memory-bank/*.md 2>&1
echo ""

echo "=== Cursor Version ==="
cursor --version 2>&1
echo ""

echo "=== Git Status ==="
git status 2>&1
echo ""

echo "=== Memory Bank Content Check ==="
wc -l memory-bank/*.md 2>&1
echo ""

echo "=== Rule Files Check ==="
find .cursor -name "*.mdc" | wc -l 2>&1
echo ""

echo "=== Recent Errors ==="
# Check system logs for Cursor-related errors
# (command varies by OS)
echo "Check system logs manually"
```

### Community Resources

1. **GitHub Issues**: [Report bugs and issues](https://github.com/your-username/cursor-memory-bank/issues)
2. **Discussions**: [Ask questions and share solutions](https://github.com/your-username/cursor-memory-bank/discussions)
3. **Documentation**: [Complete user guide](../user-guide/getting-started.md)

### Creating Effective Bug Reports

Include this information:

```markdown
## Bug Report Template

**Environment:**
- OS: [Windows/macOS/Linux + version]
- Cursor Version: [version number]
- Memory Bank Version: [commit hash or release]

**Issue Description:**
[Clear description of the problem]

**Steps to Reproduce:**
1. [First step]
2. [Second step]
3. [Third step]

**Expected Behavior:**
[What should happen]

**Actual Behavior:**
[What actually happens]

**Diagnostic Output:**
[Include output from diagnostic script above]

**Additional Context:**
[Any other relevant information]
```

## ✅ Prevention Checklist

To avoid common issues:

```
□ Keep Cursor IDE updated to latest version
□ Regularly backup memory-bank/ directory
□ Monitor disk space and file permissions
□ Test Memory Bank functionality after system updates
□ Keep project directory path reasonably short
□ Avoid special characters in file names
□ Regularly clean up temporary files
□ Monitor system resource usage
□ Keep git repository in sync
□ Document any custom modifications
```

## 🎯 Quick Reference

### Emergency Recovery Commands

```bash
# Reset Memory Bank to clean state
git checkout HEAD -- memory-bank/

# Restore from backup
cp -r memory-bank-backup memory-bank

# Reinstall from scratch
rm -rf cursor-memory-bank
git clone https://github.com/your-username/cursor-memory-bank.git
```

### Verification Commands

```bash
# Quick health check
ls memory-bank/ && ls .cursor/ && echo "✅ Structure OK"

# Test file access
echo "test" >> memory-bank/tasks.md && echo "✅ Write OK"

# Check Cursor integration
cursor --version && echo "✅ Cursor OK"
```

---

**Still having issues?** Don't hesitate to [create an issue](https://github.com/your-username/cursor-memory-bank/issues) with your diagnostic output. The community is here to help!