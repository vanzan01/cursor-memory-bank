# Memory Bank System for Cursor

A structured development workflow system that uses Cursor's custom modes to organize your coding process into clear phases.

*Forked from [vanzan01/cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) with custom enhancements:*
- **Naming conventions** - Enhanced naming standards and best practices
- **Data transformations** - Specialized workflows for data processing and transformation tasks
- **Branch management** - Automated branch validation to prevent working on merged PRs

## What This Does

Instead of jumping randomly between coding tasks, Memory Bank gives you a systematic approach:

1. **🔍 INITIALISE** - Analyze your project and determine what needs to be done
2. **📋 PLAN** - Create a detailed step-by-step plan
3. **🎨 CREATIVE** - Design complex components and explore options
4. **⚒️ IMPLEMENT** - Build the code systematically
5. **🔍 REFLECT** - Review what you learned
6. **📁 ARCHIVE** - Document everything for future reference

## Quick Setup (5 minutes)

### Step 1: Download the Files

```bash
git clone https://github.com/kobzevvv/coding-agent-rules-bank.git
cd coding-agent-rules-bank
```

### Step 2: Copy to Your Project

Copy these folders to your project root:
- `.cursor/` 
- `custom_modes/`

### Step 3: Create Custom Modes in Cursor

You need to create 5 custom modes in Cursor. Here's exactly how:

#### Mode 1: INITIALISE
1. In Cursor, click the mode selector in chat
2. Click "Add custom mode"
3. Fill in:
   - **Name**: `🔍 INITIALISE`
   - **Icon**: Choose any icon
   - **Tools**: Enable "Codebase Search", "Read File", "Terminal", "List Directory", "Fetch Rules"
   - **Advanced options**: Copy and paste the entire content from `custom_modes/van_instructions.md`

#### Mode 2: PLAN
1. Click "Add custom mode" again
2. Fill in:
   - **Name**: `📋 PLAN`
   - **Icon**: Choose any icon
   - **Tools**: Enable "Codebase Search", "Read File", "Terminal", "List Directory"
   - **Advanced options**: Copy and paste the entire content from `custom_modes/plan_instructions.md`

#### Mode 3: CREATIVE
1. Click "Add custom mode" again
2. Fill in:
   - **Name**: `🎨 CREATIVE`
   - **Icon**: Choose any icon
   - **Tools**: Enable "Codebase Search", "Read File", "Terminal", "List Directory", "Edit File", "Fetch Rules"
   - **Advanced options**: Copy and paste the entire content from `custom_modes/creative_instructions.md`

#### Mode 4: IMPLEMENT
1. Click "Add custom mode" again
2. Fill in:
   - **Name**: `⚒️ IMPLEMENT`
   - **Icon**: Choose any icon
   - **Tools**: Enable ALL tools
   - **Advanced options**: Copy and paste the entire content from `custom_modes/implement_instructions.md`

#### Mode 5: REFLECT
1. Click "Add custom mode" again
2. Fill in:
   - **Name**: `🔍 REFLECT`
   - **Icon**: Choose any icon
   - **Tools**: Enable "Codebase Search", "Read File", "Terminal", "List Directory"
   - **Advanced options**: Copy and paste the entire content from `custom_modes/reflect_archive_instructions.md`

## How to Use

### Start Any Project

1. **Switch to INITIALISE mode** in Cursor
2. **Type "INITIALISE"** in the chat
3. The system will analyze your project and tell you what to do next

### Example Workflow

```
🔍 INITIALISE → 📋 PLAN → 🎨 CREATIVE → ⚒️ IMPLEMENT → 🔍 REFLECT
```

**For simple tasks**: You might go directly from INITIALISE to IMPLEMENT
**For complex features**: You'll use the full workflow

### Common Commands

- `INITIALISE` - Start the process
- `PLAN` - Create a detailed plan
- `CREATIVE` - Design complex components
- `IMPLEMENT` - Build the code
- `REFLECT` - Review and document
- `QA` - Run technical validation (works in any mode)

## What Gets Created

The system creates these files in your project:

- `memory-bank/tasks.md` - Your current task list
- `memory-bank/progress.md` - What's been completed
- `memory-bank/activeContext.md` - Current focus
- `memory-bank/style-guide.md` - Design guidelines
- `memory-bank/naming-conventions.md` - Code naming rules

## 🔍 Branch Management Features

### Problem Solved
Ever find yourself working on a branch that's already been merged? Or working on a branch meant for a different feature? The branch management system prevents this automatically.

### How It Works
Before starting any implementation, the system automatically:

1. **Checks if your branch is related to a merged PR** → Switches to main and creates new branch if needed
2. **Validates domain/task alignment** → Creates new branch for different domains
3. **Documents branch decisions** → Updates tasks.md with validation results

### Automated Validation
```bash
# Run the branch validation script
./scripts/branch-validation.sh
```

### Branch Naming Conventions
- `feature/[domain]-[specific-feature]` - New features
- `bugfix/[issue-description]` - Bug fixes  
- `enhancement/[component]-[improvement]` - Improvements

### What It Prevents
- ❌ Working on already-merged branches
- ❌ Mixing different domains in same branch
- ❌ Confusing branch names
- ✅ Clean, organized development workflow

### Integration
The branch validation is automatically integrated into the IMPLEMENT mode workflow. No additional setup required!

### Additional Files Created
- `scripts/branch-validation.sh` - Automated branch validation script
- `BRANCH_MANAGEMENT_GUIDE.md` - Complete guide to branch management features
- Updated implementation rules with branch validation workflow

## Troubleshooting

**Mode not working?**
- Make sure you copied the entire instruction file content
- Check that you enabled the correct tools
- Verify you're in the right mode before typing commands

**Rules not loading?**
- Ensure the `.cursor/rules/` folder is in your project root
- Check file permissions

**Branch validation not working?**
- Make sure `scripts/branch-validation.sh` is executable: `chmod +x scripts/branch-validation.sh`
- Verify you're in a git repository
- Check that the script file exists in your project root

## Requirements

- Cursor Editor v0.48+
- Custom modes enabled in Cursor settings
- Claude 4 Sonnet or Opus recommended

## Why This Works

Instead of asking AI to "help me code" and getting random suggestions, Memory Bank gives you:

- **Structured workflow** - Each mode has a specific purpose
- **Context preservation** - Information flows between modes
- **Systematic approach** - No more jumping between tasks randomly
- **Documentation built-in** - Everything gets documented automatically
- **Branch management** - Prevents working on merged branches automatically

## Personal Note

This is a forked version of vanzan01's personal project with custom enhancements. The original system is designed to be adaptable - you can ask Cursor AI to modify any of the rules to better fit your workflow.

---

**Ready to get started?** Follow the Quick Setup steps above and type "INITIALISE" in your first mode!
