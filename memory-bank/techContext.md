# Memory Bank: Technical Context

## Platform Information
- **Operating System**: macOS (darwin 23.6.0)
- **Shell**: /opt/homebrew/bin/zsh
- **Path Separator**: Forward Slash (/)
- **IDE**: Cursor IDE

## Technology Stack

### Core Technologies
- **Language**: Markdown (документация), PowerShell/Bash (скрипты)
- **Architecture**: File-based Memory Bank system
- **Storage**: Local file system
- **Integration**: .cursor/rules system

### Development Tools
- **Package Manager**: bun (по пользовательским правилам)
- **Testing Framework**: bun:test
- **Formatting**: 2 spaces, no tabs
- **Linting**: Enabled

### User Preferences
- **Response Language**: Russian
- **Code Language**: English
- **Comments**: English only
- **Framework Detection**: Automatic

## File Structure Requirements
- Memory Bank files в директории `memory-bank/`
- Правила в `.cursor/rules/`
- Документация в корне проекта
- Архивы в `memory-bank/archive/`

## Integration Points
- VAN.RULES для управления правилами
- VAN.SYSTEM для системного администрирования
- Автоматическая синхронизация с .cursor/rules

## Current Capabilities
- [x] Platform detection
- [x] File system operations
- [x] Memory Bank creation
- [ ] Rules integration
- [ ] System optimization