# Memory Bank Global Setup Guide

This guide will help you set up the Memory Bank system globally in Cursor, so you can use it in any project without copying files.

## ✅ Step 1: Global Installation (Complete)

The global setup script has already been run. Your files are now located at:

- **Rules**: `~/.cursor/global-rules/isolation_rules/`
- **Mode Instructions**: `~/.cursor/global-modes/`

## 📋 Step 2: Create Custom Modes in Cursor

You need to create 5 custom modes in Cursor. Here's exactly how:

### Mode 1: 🔍 INITIALISE
1. In Cursor, click the mode selector in chat
2. Click "Add custom mode"
3. Fill in:
   - **Name**: `🔍 INITIALISE`
   - **Icon**: Choose any icon
   - **Tools**: Enable "Codebase Search", "Read File", "Terminal", "List Directory", "Fetch Rules"
   - **Advanced options**: Copy and paste the entire content from `~/.cursor/global-modes/van_instructions_global.md`

### Mode 2: 📋 PLAN
1. Click "Add custom mode" again
2. Fill in:
   - **Name**: `📋 PLAN`
   - **Icon**: Choose any icon
   - **Tools**: Enable "Codebase Search", "Read File", "Terminal", "List Directory"
   - **Advanced options**: Copy and paste the entire content from `~/.cursor/global-modes/plan_instructions_global.md`

### Mode 3: 🎨 CREATIVE
1. Click "Add custom mode" again
2. Fill in:
   - **Name**: `🎨 CREATIVE`
   - **Icon**: Choose any icon
   - **Tools**: Enable "Codebase Search", "Read File", "Terminal", "List Directory", "Edit File", "Fetch Rules"
   - **Advanced options**: Copy and paste the entire content from `~/.cursor/global-modes/creative_instructions.md`

### Mode 4: ⚒️ IMPLEMENT
1. Click "Add custom mode" again
2. Fill in:
   - **Name**: `⚒️ IMPLEMENT`
   - **Icon**: Choose any icon
   - **Tools**: Enable ALL tools
   - **Advanced options**: Copy and paste the entire content from `~/.cursor/global-modes/implement_instructions.md`

### Mode 5: 🔍 REFLECT
1. Click "Add custom mode" again
2. Fill in:
   - **Name**: `🔍 REFLECT`
   - **Icon**: Choose any icon
   - **Tools**: Enable "Codebase Search", "Read File", "Terminal", "List Directory"
   - **Advanced options**: Copy and paste the entire content from `~/.cursor/global-modes/reflect_archive_instructions.md`

## 🎯 Step 3: Using the System

### In Any Project:
1. **Open any project** in Cursor
2. **Switch to 🔍 INITIALISE mode** in the chat
3. **Type "INITIALISE"** to start the process
4. The system will automatically create a `memory-bank/` directory in your project

### Workflow:
```
🔍 INITIALISE → 📋 PLAN → 🎨 CREATIVE → ⚒️ IMPLEMENT → 🔍 REFLECT
```

## 📁 What Gets Created Per Project

Each project will automatically get its own `memory-bank/` directory with:

- `tasks.md` - Current task tracking
- `progress.md` - Project progress
- `activeContext.md` - Current focus
- `style-guide.md` - Design guidelines
- `naming-conventions.md` - Code naming rules
- `creative/` - Creative phase documents
- `reflection/` - Reflection documents
- `archive/` - Completed task archives

## 🔧 Troubleshooting

**Mode not working?**
- Make sure you copied the entire instruction file content
- Check that you enabled the correct tools
- Verify you're in the right mode before typing commands

**Rules not loading?**
- Ensure the global rules are in `~/.cursor/global-rules/isolation_rules/`
- Check file permissions

**Project-specific issues?**
- Each project gets its own `memory-bank/` directory
- The system automatically creates this on first use

## 🚀 Benefits of Global Setup

✅ **No file copying** - Works in any project automatically
✅ **Consistent workflow** - Same system across all projects
✅ **Easy maintenance** - Update rules once, affects all projects
✅ **Project isolation** - Each project has its own memory bank
✅ **One-time setup** - Create modes once, use everywhere

## 📝 Quick Reference

**Commands:**
- `INITIALISE` - Start the process
- `PLAN` - Create a detailed plan
- `CREATIVE` - Design complex components
- `IMPLEMENT` - Build the code
- `REFLECT` - Review and document
- `QA` - Run technical validation

**Global Files:**
- Rules: `~/.cursor/global-rules/isolation_rules/`
- Mode instructions: `~/.cursor/global-modes/`

**Project Files:**
- Memory bank: `memory-bank/` (created automatically)

---

**Ready to get started?** Create the custom modes in Cursor and type "INITIALISE" in any project! 