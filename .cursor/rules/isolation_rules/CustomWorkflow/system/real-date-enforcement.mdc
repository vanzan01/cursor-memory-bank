---
description: "Real date enforcement system to prevent hardcoded dates"
globs: "**/system/**", "**/date/**", "**/tasks/**"
alwaysApply: true
---

# REAL DATE ENFORCEMENT SYSTEM

This rule enforces the use of real current dates instead of hardcoded dates like "2024-12-09".

## Core Principle
Always use actual current date from system: `date +%Y-%m-%d`

## Current Date Storage
File: `memory-bank/system/current-date.txt`
Contains: Real current date in YYYY-MM-DD format

## Hardcoded Date Detection
Search for: `2024-12-09` and replace with current date
Command: `grep -r "2024-12-09" memory-bank/`

## Replacement Process
1. Get current date: `date +%Y-%m-%d`
2. Store in current-date.txt
3. Replace all hardcoded dates
4. Validate consistency