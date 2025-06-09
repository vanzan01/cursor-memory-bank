# Detailed Setup Guide

> **Complete installation and configuration guide for Cursor Memory Bank**

This comprehensive guide walks you through the complete setup process for Cursor Memory Bank, including advanced configuration options, customization, and verification procedures.

## 📋 Prerequisites

### System Requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| **Operating System** | Windows 10, macOS 10.15, Ubuntu 18.04 | Latest stable versions |
| **Cursor IDE** | v0.30+ | Latest version |
| **Disk Space** | 50 MB | 100 MB |
| **Memory** | 4 GB RAM | 8 GB RAM |

### Required Software

1. **Cursor IDE**: Download from [cursor.sh](https://cursor.sh/)
2. **Git**: For cloning the repository
3. **Text Editor**: For configuration (if needed)

### Optional Dependencies

- **Node.js**: For advanced customization (v16+)
- **Python**: For custom scripts (v3.8+)
- **Package Manager**: npm, yarn, or bun

## 🚀 Installation Methods

### Method 1: Git Clone (Recommended)

#### Step 1: Clone Repository

```bash
# Clone the repository
git clone https://github.com/your-username/cursor-memory-bank.git

# Navigate to project directory
cd cursor-memory-bank
```

#### Step 2: Verify Installation

```bash
# Check directory structure
ls -la

# Verify core files exist
ls memory-bank/
ls .cursor/
```

**Expected Output:**
```
memory-bank/
├── activeContext.md
├── progress.md
├── tasks.md
├── projectbrief.md
└── ...

.cursor/
├── rules/
└── ...
```

### Method 2: Download ZIP

#### Step 1: Download

1. Visit the [GitHub repository](https://github.com/your-username/cursor-memory-bank)
2. Click **"Code"** → **"Download ZIP"**
3. Extract to your desired location

#### Step 2: Verify Download

- Ensure all directories are present
- Check file permissions (Unix/Linux/macOS)

### Method 3: Fork and Clone

#### Step 1: Fork Repository

1. Visit the repository on GitHub
2. Click **"Fork"** button
3. Clone your fork:

```bash
git clone https://github.com/YOUR-USERNAME/cursor-memory-bank.git
```

## ⚙️ Configuration

### Basic Configuration

#### Step 1: Open in Cursor IDE

```bash
# Open project in Cursor
cursor .

# Or use the GUI:
# File → Open Folder → Select cursor-memory-bank
```

#### Step 2: Verify Cursor Integration

1. Open any `.md` file in the project
2. Check that Cursor recognizes the Memory Bank rules
3. Test AI assistant functionality

### Advanced Configuration

#### Custom Rules Setup

1. **Navigate to rules directory:**
   ```bash
   cd .cursor/rules
   ```

2. **Review available rules:**
   ```bash
   ls isolation_rules/
   ```

3. **Customize rules (optional):**
   - Edit existing rules in `.cursor/rules/`
   - Add custom rules following the pattern
   - Maintain the hierarchical structure

#### Memory Bank Customization

1. **Project Brief Setup:**
   ```bash
   # Edit project brief
   nano memory-bank/projectbrief.md
   ```

2. **Tech Context Configuration:**
   ```bash
   # Configure technology stack
   nano memory-bank/techContext.md
   ```

3. **System Patterns Setup:**
   ```bash
   # Define project patterns
   nano memory-bank/systemPatterns.md
   ```

### Platform-Specific Setup

#### Windows Setup

```powershell
# PowerShell commands
# Verify installation
Get-ChildItem -Path "memory-bank" -Recurse
Get-ChildItem -Path ".cursor" -Recurse

# Set execution policy (if needed)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### macOS Setup

```bash
# Verify permissions
ls -la memory-bank/
ls -la .cursor/

# Fix permissions if needed
chmod -R 755 .cursor/
chmod -R 644 memory-bank/*.md
```

#### Linux Setup

```bash
# Install dependencies (Ubuntu/Debian)
sudo apt update
sudo apt install git curl

# Verify installation
find . -name "*.md" | head -10
find . -name "*.mdc" | head -10
```

## 🔧 Verification & Testing

### Basic Functionality Test

#### Test 1: Memory Bank Recognition

1. Open `memory-bank/tasks.md`
2. Add a test task:
   ```markdown
   ## Test Task
   - [ ] Verify Memory Bank functionality
   ```
3. Save and check if Cursor recognizes the format

#### Test 2: Rules Integration

1. Type "VAN" in any file
2. Observe if Cursor suggests Memory Bank workflows
3. Test mode transitions (VAN → PLAN → CREATIVE → IMPLEMENT)

#### Test 3: File Structure Validation

```bash
# Run validation script
find . -name "*.md" -exec grep -l "Memory Bank" {} \;

# Check for required files
test -f memory-bank/tasks.md && echo "✅ tasks.md exists"
test -f memory-bank/progress.md && echo "✅ progress.md exists"
test -f memory-bank/activeContext.md && echo "✅ activeContext.md exists"
```

### Advanced Testing

#### Integration Test

1. **Start a new project workflow:**
   ```
   1. Type "VAN" to initialize
   2. Follow the guided workflow
   3. Progress through modes: VAN → PLAN → CREATIVE → IMPLEMENT
   4. Verify each mode transition works correctly
   ```

2. **Test Memory Bank updates:**
   - Check that `tasks.md` updates automatically
   - Verify `progress.md` tracks changes
   - Confirm `activeContext.md` maintains state

#### Performance Test

```bash
# Test file access speed
time find . -name "*.md" | wc -l
time grep -r "Memory Bank" . | wc -l

# Check memory usage (macOS/Linux)
du -sh .
du -sh memory-bank/
du -sh .cursor/
```

## 🎯 First Usage

### Quick Start Workflow

#### Step 1: Initialize New Project

1. Open Cursor IDE in your project directory
2. Type "VAN" to start Memory Bank
3. Follow the initialization prompts

#### Step 2: Set Up Project Context

1. **Edit Project Brief:**
   ```markdown
   # Project Brief
   **Project Name**: Your Project Name
   **Description**: Brief description
   **Goals**: Main objectives
   ```

2. **Configure Tech Stack:**
   ```markdown
   # Tech Context
   **Framework**: React/Vue/Angular
   **Language**: JavaScript/TypeScript
   **Tools**: Your development tools
   ```

#### Step 3: Create First Task

1. Open `memory-bank/tasks.md`
2. Add your first task:
   ```markdown
   ## Task: [Your Task Name]
   **Priority**: HIGH/MEDIUM/LOW
   **Status**: 🔄 IN PROGRESS

   ### Requirements
   1. [ ] Requirement 1
   2. [ ] Requirement 2
   ```

### Example Workflow

#### Scenario: Bug Fix Project

```markdown
1. **VAN Mode**: Initialize and analyze the bug
2. **PLAN Mode**: Plan the fix approach
3. **IMPLEMENT Mode**: Apply the fix
4. **QA Mode**: Test the solution
5. **REFLECT Mode**: Document the process
```

## 🔍 Troubleshooting

### Common Issues

#### Issue 1: Cursor Not Recognizing Rules

**Symptoms:**
- AI doesn't suggest Memory Bank workflows
- No mode transitions available

**Solutions:**
1. **Restart Cursor IDE**
2. **Check file paths:**
   ```bash
   ls .cursor/rules/
   ```
3. **Verify rule files:**
   ```bash
   find .cursor -name "*.mdc" | head -5
   ```

#### Issue 2: Memory Bank Files Not Updating

**Symptoms:**
- `tasks.md` doesn't update automatically
- Progress tracking not working

**Solutions:**
1. **Check file permissions:**
   ```bash
   ls -la memory-bank/
   ```
2. **Verify file format:**
   - Ensure proper Markdown syntax
   - Check for encoding issues
3. **Manual update test:**
   - Edit files manually
   - Save and reload

#### Issue 3: Performance Issues

**Symptoms:**
- Slow file loading
- High memory usage

**Solutions:**
1. **Check project size:**
   ```bash
   du -sh .
   ```
2. **Optimize file structure:**
   - Remove unnecessary files
   - Archive old projects
3. **Update Cursor IDE:**
   - Download latest version
   - Clear cache if needed

### Platform-Specific Issues

#### Windows Issues

**PowerShell Execution Policy:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**File Path Issues:**
- Use forward slashes in paths
- Avoid spaces in directory names

#### macOS Issues

**Permission Denied:**
```bash
sudo chown -R $USER:$USER .
chmod -R 755 .cursor/
```

**Gatekeeper Issues:**
- Allow Cursor in System Preferences → Security & Privacy

#### Linux Issues

**Missing Dependencies:**
```bash
sudo apt install git curl nodejs npm
```

**File System Issues:**
```bash
# Check disk space
df -h
# Check inodes
df -i
```

## 📚 Next Steps

### Learning Resources

1. **[Quick Start Guide](quick-start.md)** - 5-minute setup
2. **[User Guide](../user-guide/getting-started.md)** - Comprehensive usage
3. **[Examples](../examples/)** - Real-world scenarios
4. **[Best Practices](../user-guide/best-practices.md)** - Optimization tips

### Community

- **GitHub Issues**: Report bugs and request features
- **Discussions**: Ask questions and share experiences
- **Contributing**: See [CONTRIBUTING.md](../../CONTRIBUTING.md)

### Advanced Topics

- **Custom Rules**: Create your own workflow rules
- **Integration**: Connect with other tools
- **Automation**: Script common workflows
- **Team Setup**: Multi-user configurations

## ✅ Setup Verification Checklist

```
□ Cursor IDE installed and updated
□ Repository cloned/downloaded successfully
□ All core files present in memory-bank/
□ Rules directory (.cursor/) accessible
□ Basic functionality test passed
□ First project initialized
□ Memory Bank workflow tested
□ Documentation reviewed
□ Troubleshooting guide bookmarked
□ Ready for productive use
```

## 🎉 Congratulations!

You've successfully set up Cursor Memory Bank! You're now ready to experience AI-powered context management that will transform your development workflow.

**What's Next?**
- Start with a simple project using the [Quick Start Guide](quick-start.md)
- Explore [real-world examples](../examples/) to see Memory Bank in action
- Join our community to share your experience and learn from others

---

**Need Help?** Check our [Troubleshooting Guide](#-troubleshooting) or visit our [GitHub Issues](https://github.com/your-username/cursor-memory-bank/issues) page.