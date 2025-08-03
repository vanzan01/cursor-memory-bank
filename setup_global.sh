#!/bin/bash

# Memory Bank Global Setup Script
# This script sets up the Memory Bank system globally in Cursor

echo "🚀 Setting up Memory Bank system globally..."

# Step 1: Create global rules directory
echo "📁 Creating global rules directory..."
mkdir -p ~/.cursor/global-rules

# Step 2: Copy rules to global location
echo "📋 Copying rules to global location..."
cp -r .cursor/rules/isolation_rules ~/.cursor/global-rules/

# Step 3: Create global custom modes directory
echo "🎯 Creating global custom modes directory..."
mkdir -p ~/.cursor/global-modes

# Step 4: Copy custom modes to global location
echo "📝 Copying custom modes to global location..."
cp -r custom_modes/* ~/.cursor/global-modes/

echo "✅ Global setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Open Cursor"
echo "2. Create 5 custom modes using the instructions in ~/.cursor/global-modes/"
echo "3. Use the global versions of the mode instructions"
echo ""
echo "🎯 To use in any project:"
echo "1. Open any project in Cursor"
echo "2. Switch to 🔍 INITIALISE mode"
echo "3. Type 'INITIALISE' to start"
echo ""
echo "📁 Global files location:"
echo "- Rules: ~/.cursor/global-rules/isolation_rules/"
echo "- Mode instructions: ~/.cursor/global-modes/" 