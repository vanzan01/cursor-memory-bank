# Quick Start Guide

Get Cursor Memory Bank running in your project in under 5 minutes.

## 📋 Prerequisites

Before you begin, ensure you have:

- [ ] **Cursor IDE** installed ([Download here](https://cursor.sh/))
- [ ] **Git** installed on your system
- [ ] **Basic familiarity** with AI-assisted development

## 🚀 Installation Steps

### Step 1: Clone the Repository

```bash
git clone https://github.com/your-username/cursor-memory-bank.git
cd cursor-memory-bank
```

### Step 2: Set Up Memory Bank

```bash
# Copy rules to Cursor configuration
cp -r rules/ .cursor/rules/

# Initialize Memory Bank structure
mkdir -p memory-bank/{archive,creative,development,reflection}
```

### Step 3: Verify Installation

```bash
# Check if rules are properly installed
ls .cursor/rules/isolation_rules/

# You should see directories like:
# Core/  Level1/  Level2/  Level3/  Level4/  Phases/  visual-maps/
```

**Expected output:**
```
Core
Level1
Level2
Level3
Level4
Phases
visual-maps
```

### Step 4: Configure Cursor IDE

1. **Open Cursor IDE**
2. **Open your project** (or create a new one)
3. **Verify Memory Bank is active** by checking that `.cursor/rules/` directory exists in your project

## ✅ Verification

To verify Memory Bank is working correctly:

1. **Open Cursor IDE** in your project
2. **Start a new chat** with the AI assistant
3. **Type `VAN`** and press Enter
4. **You should see** Memory Bank initialize and analyze your project

**Expected response:**
```
🔍 VAN MODE ACTIVATED

Initializing Memory Bank for your project...
- Platform detected: [Your OS]
- Project structure analyzed
- Complexity assessment in progress...
```

## 🎯 Your First Memory Bank Session

### Quick Bug Fix Example (Level 1)

1. **Type `VAN`** in Cursor chat
2. **Describe your issue**: "I have a bug in my login function"
3. **Follow the guided workflow**:
   - VAN will analyze the issue
   - Determine it's a Level 1 task
   - Guide you through quick resolution

### Feature Development Example (Level 3)

1. **Type `VAN`** in Cursor chat
2. **Describe your feature**: "I want to add user authentication"
3. **Follow the guided workflow**:
   - VAN will assess complexity (Level 3)
   - Transition to PLAN mode for architecture
   - Move to CREATIVE mode for design decisions
   - Guide through IMPLEMENT mode for building

## 🔧 Common Issues & Solutions

### Issue: Rules not found
**Symptoms**: Memory Bank doesn't respond to `VAN` command
**Solution**:
```bash
# Verify rules directory exists
ls .cursor/rules/isolation_rules/

# If missing, re-copy rules
cp -r rules/ .cursor/rules/
```

### Issue: Permission denied
**Symptoms**: Cannot copy rules to `.cursor/` directory
**Solution**:
```bash
# Create directory first
mkdir -p .cursor/rules/

# Then copy with proper permissions
cp -r rules/ .cursor/rules/
chmod -R 755 .cursor/rules/
```

### Issue: Memory Bank structure missing
**Symptoms**: Memory Bank complains about missing directories
**Solution**:
```bash
# Create all required directories
mkdir -p memory-bank/{archive,creative,development,reflection}
mkdir -p memory-bank/tasks.md
```

## 📚 Next Steps

Now that Memory Bank is installed:

1. **📖 Read the [Getting Started Guide](../user-guide/getting-started.md)** - Learn the basics
2. **🔄 Try the [Workflow Guide](../user-guide/workflow-guide.md)** - Understand the full process
3. **💡 Explore [Examples](../examples/)** - See real-world usage
4. **🎯 Check [Best Practices](../user-guide/best-practices.md)** - Optimize your workflow

## 🆘 Need Help?

- **📖 Documentation**: Browse our [complete documentation](../)
- **🐛 Issues**: Report problems on [GitHub Issues](https://github.com/your-username/cursor-memory-bank/issues)
- **💬 Discussions**: Join [GitHub Discussions](https://github.com/your-username/cursor-memory-bank/discussions)
- **📧 Support**: Create an issue for technical support

## 🎉 Success!

You're now ready to use Cursor Memory Bank! Start with `VAN` in any Cursor chat to begin your AI-assisted development journey.

---

> 💡 **Pro Tip**: Memory Bank adapts to your project's complexity automatically. Start simple and let it guide you through more complex workflows as needed.