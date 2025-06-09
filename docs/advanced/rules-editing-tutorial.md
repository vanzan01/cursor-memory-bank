# Rules Editing Tutorial

> **Advanced Tutorial**: Step-by-step guide for safely modifying Cursor IDE rules when direct editing of `.cursor` directory files is restricted. This tutorial covers the complete workaround process to ensure systematic rule corrections while maintaining system integrity.

## 🎯 Overview

This tutorial teaches you how to modify `.cursor/rules` files when Cursor IDE restricts direct editing. You'll learn the complete workaround process that allows safe rule modifications while preserving system functionality.

### What You'll Learn
- How to identify common rule issues
- The complete Cursor workaround process
- Safe rule modification techniques
- Verification and validation procedures
- Best practices for rule management

### Prerequisites
- Basic understanding of file system operations
- Familiarity with command line (optional but helpful)
- Access to VAN.RULES system
- Git repository with clean working state

## 🔍 Step 1: Issue Analysis

Before modifying any rules, you need to identify what needs to be fixed.

### Common Rule Issues

#### 1. File Extension Problems
**Issue**: References to `.md` files that should be `.mdc`
```
❌ Incorrect: creative-phase-enforcement.md
✅ Correct:   creative-phase-enforcement.mdc
```

#### 2. Case Sensitivity Issues
**Issue**: Incorrect case in globs and paths
```
❌ Incorrect: "**/level1/**", "**/level2/**"
✅ Correct:   "**/Level1/**", "**/Level2/**"
```

#### 3. Broken File References
**Issue**: Links to non-existent files
```
❌ Incorrect: level1-map.mdc (doesn't exist)
✅ Correct:   workflow-level1.mdc (exists)
```

#### 4. Missing Metadata Headers
**Issue**: Files without proper frontmatter
```yaml
❌ Missing header

✅ Correct header:
---
description: Rule description
globs: "**/Level1/**", "**/workflow/**"
alwaysApply: false
---
```

### Using VAN.RULES for Analysis

The easiest way to identify issues is using the VAN.RULES system:

```
User: VAN.RULES.VALIDATE
Assistant: OK VAN.RULES

✅ Activating rules validation process...
🔍 Scanning all .mdc files...
📊 Checking file extensions, case sensitivity, links...
📋 Generating validation report...

Issues Found:
- 5 case sensitivity problems in Level references
- 3 incorrect file extension references
- 2 broken file links
- 1 missing metadata header
```

## 🛠️ Step 2: Preparation Phase

### 2.1 Verify Git Status

Before making any changes, ensure your repository is in a clean state:

```bash
git status
```

You should see:
```
On branch main
nothing to commit, working tree clean
```

If you have uncommitted changes, commit or stash them first.

### 2.2 Create a Backup Branch (Recommended)

```bash
git checkout -b rules-modification-backup
git checkout main
```

### 2.3 Plan Your Changes

Document what you plan to fix:
```markdown
## Rule Modification Plan
- Fix case sensitivity: level1 → Level1, level2 → Level2
- Update file extensions: .md → .mdc where appropriate
- Fix broken links: level1-map.mdc → workflow-level1.mdc
- Add missing headers to optimization-integration.mdc
```

## 🔄 Step 3: Cursor Workaround Process

This is the core technique that allows editing when Cursor IDE restricts access.

### 3.1 Rename the .cursor Directory

```bash
mv .cursor _cursor
```

**Why this works**: Cursor IDE only restricts editing of `.cursor` directories. By renaming it to `_cursor`, we can edit freely.

### 3.2 Rename .mdc Files for Editing

```bash
find _cursor -name "*.mdc" -exec sh -c 'mv "$1" "$1.md"' _ {} \;
```

**What this does**:
- Finds all `.mdc` files in the `_cursor` directory
- Renames them to `.mdc.md` so they can be edited as Markdown files
- Preserves the original extension for later restoration

### 3.3 Apply Your Corrections

Now you can use the `edit_file` tool to make your planned changes. Here are examples:

#### Fix Case Sensitivity Issues
```
Target file: _cursor/rules/isolation_rules/Level1/workflow-level1.mdc.md

Find: "**/level1/**"
Replace: "**/Level1/**"

Find: "**/level2/**"
Replace: "**/Level2/**"
```

#### Fix File Extension References
```
Target file: _cursor/rules/isolation_rules/main.mdc.md

Find: creative-phase-enforcement.md
Replace: creative-phase-enforcement.mdc
```

#### Fix Broken File Links
```
Target file: _cursor/rules/isolation_rules/visual-maps/plan-mode-map.mdc.md

Find: [Level 1 Map](level1-map.mdc)
Replace: [Level 1 Workflow](workflow-level1.mdc)
```

#### Add Missing Headers
```
Target file: _cursor/rules/isolation_rules/Core/optimization-integration.mdc.md

Add at the beginning:
---
description: Integration hub for Memory Bank optimizations
globs: "**/optimization/**", "**/integration/**"
alwaysApply: false
---
```

### 3.4 Verify Changes Applied

Check that your changes were applied correctly:

```bash
# Check case sensitivity fixes
grep -r "Level[1-4]" _cursor/rules/ --include="*.mdc.md"

# Check file extension fixes
grep -r "\.mdc" _cursor/rules/ --include="*.mdc.md"

# Check for missing headers
find _cursor/rules/ -name "*.mdc.md" -exec head -5 {} \; | grep -c "^---"
```

### 3.5 Restore File Extensions

```bash
find _cursor -name "*.mdc.md" -exec sh -c 'mv "$1" "${1%.md}"' _ {} \;
```

**What this does**: Removes the `.md` extension, restoring files to their original `.mdc` format.

### 3.6 Restore Directory Name

```bash
mv _cursor .cursor
```

**Final step**: Restores the original `.cursor` directory name, making the rules active again.

## ✅ Step 4: Verification and Testing

### 4.1 Test Rule Loading

Use VAN.RULES to verify your changes:

```
User: VAN.RULES.VALIDATE
Assistant: OK VAN.RULES

✅ Validation complete!
📊 All rules passed validation
🎯 No issues detected
```

### 4.2 Manual Verification Commands

```bash
# Verify no incorrect case remains
grep -r "level[1-4]" .cursor/rules/ --include="*.mdc"
# Should return no results

# Verify no .md references (except Memory Bank files)
grep -r "\.md[^c]" .cursor/rules/ --include="*.mdc"
# Should return no results

# Verify all files have headers
find .cursor/rules/ -name "*.mdc" -exec head -5 {} \; | grep -c "^---"
# Should return a count equal to the number of .mdc files
```

### 4.3 Test System Functionality

Test that the Memory Bank system still works correctly:

```
User: VAN
Assistant: OK VAN

🔍 Activating VAN mode...
📚 Loading rules successfully...
✅ All systems operational
```

## 🚨 Troubleshooting

### Issue: Changes Not Applied
**Symptoms**: Your edits don't seem to take effect
**Solutions**:
1. Verify you're editing the renamed files (`.mdc.md`)
2. Check file permissions
3. Ensure you followed the restoration sequence correctly

### Issue: Rules Not Loading
**Symptoms**: VAN.RULES.VALIDATE reports errors
**Solutions**:
1. Check file extensions are correct (`.mdc` not `.md`)
2. Verify glob patterns match actual file structure
3. Validate YAML headers are properly formatted

### Issue: Git Shows Unexpected Changes
**Symptoms**: `git diff` shows more changes than expected
**Solutions**:
1. Review changes carefully with `git diff`
2. Use `git add -p` to stage changes selectively
3. Commit logical groups of changes separately

### Issue: Cursor IDE Still Restricts Access
**Symptoms**: Can't edit files even after workaround
**Solutions**:
1. Ensure directory is renamed to `_cursor` (not `.cursor`)
2. Check that files have `.md` extension during editing
3. Restart Cursor IDE if necessary

## 📋 Complete Example Session

Here's a complete example of fixing case sensitivity issues:

### Before Starting
```bash
git status  # Ensure clean working tree
git checkout -b rules-fix-case-sensitivity
```

### Apply Workaround
```bash
# Step 1: Rename directory
mv .cursor _cursor

# Step 2: Rename files for editing
find _cursor -name "*.mdc" -exec sh -c 'mv "$1" "$1.md"' _ {} \;

# Step 3: Apply corrections (using edit_file tool)
# Fix: "**/level1/**" → "**/Level1/**" in multiple files
# Fix: "**/level2/**" → "**/Level2/**" in multiple files

# Step 4: Verify changes
grep -r "Level[1-4]" _cursor/rules/ --include="*.mdc.md"

# Step 5: Restore file extensions
find _cursor -name "*.mdc.md" -exec sh -c 'mv "$1" "${1%.md}"' _ {} \;

# Step 6: Restore directory name
mv _cursor .cursor
```

### Verify and Commit
```bash
# Test the changes
VAN.RULES.VALIDATE

# Review changes
git diff

# Commit changes
git add .cursor/rules/
git commit -m "Fix case sensitivity in Level references

- Updated all level1/level2/level3/level4 references to Level1/Level2/Level3/Level4
- Ensures proper glob pattern matching
- Fixes rule loading issues"

# Merge back to main
git checkout main
git merge rules-fix-case-sensitivity
git branch -d rules-fix-case-sensitivity
```

## 🎯 Best Practices

### Planning and Preparation
1. **Always backup**: Create a git branch before making changes
2. **Plan systematically**: Document all intended changes
3. **Work incrementally**: Fix one type of issue at a time
4. **Test frequently**: Validate after each major change

### During Editing
1. **Follow the sequence**: Always use the complete workaround process
2. **Double-check file names**: Ensure you're editing `.mdc.md` files
3. **Preserve formatting**: Maintain existing indentation and structure
4. **Validate syntax**: Check YAML headers and glob patterns

### After Changes
1. **Verify thoroughly**: Use both automated and manual verification
2. **Test functionality**: Ensure the Memory Bank system works correctly
3. **Document changes**: Write clear commit messages
4. **Clean up**: Remove backup branches after successful merging

### Safety Guidelines
1. **Never skip verification**: Always validate changes before committing
2. **Keep changes focused**: Don't mix different types of fixes in one session
3. **Use descriptive commits**: Make it easy to understand what was changed
4. **Test in isolation**: Verify each change works independently

## 🔗 Related Documentation

- [VAN.RULES System Guide](van-rules-system.md) - Overview of the rules management system
- [Rules Integration Guide](rules-integration.md) - Integrating rules with Memory Bank
- [System Administration](system-administration.md) - Advanced system management

## 📚 Advanced Techniques

### Batch Processing Multiple Files

For large-scale changes, you can process multiple files efficiently:

```bash
# Find and fix all case sensitivity issues
find _cursor -name "*.mdc.md" -exec sed -i 's/level1/Level1/g' {} \;
find _cursor -name "*.mdc.md" -exec sed -i 's/level2/Level2/g' {} \;
find _cursor -name "*.mdc.md" -exec sed -i 's/level3/Level3/g' {} \;
find _cursor -name "*.mdc.md" -exec sed -i 's/level4/Level4/g' {} \;
```

### Creating Custom Validation Scripts

You can create scripts to automate validation:

```bash
#!/bin/bash
# validate-rules.sh

echo "🔍 Validating rule files..."

# Check for case sensitivity issues
if grep -r "level[1-4]" .cursor/rules/ --include="*.mdc" > /dev/null; then
    echo "❌ Case sensitivity issues found"
    exit 1
fi

# Check for incorrect extensions
if grep -r "\.md[^c]" .cursor/rules/ --include="*.mdc" > /dev/null; then
    echo "❌ Incorrect file extensions found"
    exit 1
fi

echo "✅ All validations passed"
```

---

**Next Steps**:
- Learn about system integration in the [Rules Integration Guide](rules-integration.md)
- Explore advanced administration with [System Administration Guide](system-administration.md)
- Master the complete system with [VAN.RULES System Guide](van-rules-system.md)