# Test Commit Message Automation

This file is created to test the commit message automation functionality.

## What We're Testing

1. **Auto-generated commit messages** based on file changes
2. **File type detection** (markdown files should generate "docs:" messages)
3. **Input validation** to prevent empty messages
4. **Fallback messages** when analysis fails

## Expected Behavior

When we commit this file, the automation should generate:
- `docs: Update test-commit-automation` or
- `docs: Add test-commit-automation`

This demonstrates how the commit message automation works in practice. 