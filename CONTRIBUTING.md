# Contributing to Cursor Memory Bank

Thank you for your interest in contributing to Cursor Memory Bank! This document provides guidelines and information for contributors.

## 🤝 How to Contribute

We welcome contributions of all kinds:

- 🐛 **Bug Reports**: Help us identify and fix issues
- 💡 **Feature Requests**: Suggest new features or improvements
- 📖 **Documentation**: Improve our documentation
- 💻 **Code**: Contribute to the codebase
- 🌐 **Translations**: Help us support more languages
- 🎨 **Design**: Improve user experience and visual design

## 🚀 Getting Started

### Prerequisites

- [Cursor IDE](https://cursor.sh/) installed
- Basic understanding of AI-assisted development
- Familiarity with Git and GitHub workflows
- For code contributions: Knowledge of the technologies used in the project

### Setting Up Development Environment

1. **Fork the repository**
   ```bash
   # Fork on GitHub, then clone your fork
   git clone https://github.com/your-username/cursor-memory-bank.git
   cd cursor-memory-bank
   ```

2. **Set up the development environment**
   ```bash
   # Install Memory Bank in development mode
   cp -r rules/ .cursor/rules/
   mkdir -p memory-bank/{archive,creative,development,reflection}
   ```

3. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

## 📋 Contribution Guidelines

### Code Contributions

#### Code Style
- Follow existing code patterns and conventions
- Use clear, descriptive variable and function names
- Add comments for complex logic
- Ensure code is well-documented

#### Testing
- Test your changes thoroughly
- Include test cases for new features
- Verify that existing functionality still works
- Test on different platforms when possible

#### Commit Messages
Use clear, descriptive commit messages:
```
feat: add new VAN mode functionality
fix: resolve issue with context preservation
docs: update installation guide
style: improve code formatting
refactor: reorganize rule structure
test: add tests for CREATIVE mode
```

### Documentation Contributions

#### Writing Style
- Use clear, concise language
- Follow the established style guide
- Include examples where helpful
- Maintain consistency with existing documentation

#### Bilingual Support
- For English documentation: Write in clear, accessible English
- For Russian documentation: Use formal tone and proper technical terminology
- Maintain parallel structure between language versions
- Keep technical terms consistent across languages

#### Documentation Structure
- Follow the established directory structure
- Use appropriate headings and formatting
- Include navigation links where relevant
- Add new documents to the appropriate index

### Translation Contributions

We welcome translations to additional languages:

1. **Create language-specific files** using the suffix pattern (e.g., `_es.md` for Spanish)
2. **Maintain parallel structure** with existing documentation
3. **Use appropriate cultural adaptations** while preserving technical accuracy
4. **Follow local conventions** for formatting and style

## 🐛 Reporting Issues

### Bug Reports

When reporting bugs, please include:

- **Clear description** of the issue
- **Steps to reproduce** the problem
- **Expected behavior** vs actual behavior
- **Environment details** (OS, Cursor version, etc.)
- **Screenshots or logs** if applicable

Use this template:

```markdown
## Bug Description
Brief description of the issue

## Steps to Reproduce
1. Step one
2. Step two
3. Step three

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Environment
- OS: [e.g., macOS 14.0]
- Cursor Version: [e.g., 0.48.0]
- Memory Bank Version: [e.g., 1.0.0]

## Additional Context
Any other relevant information
```

### Feature Requests

When suggesting features:

- **Describe the problem** the feature would solve
- **Explain the proposed solution** in detail
- **Consider alternatives** and explain why your approach is best
- **Provide use cases** and examples

## 🔄 Pull Request Process

### Before Submitting

1. **Check existing issues** to avoid duplicates
2. **Test your changes** thoroughly
3. **Update documentation** if needed
4. **Follow code style guidelines**
5. **Write clear commit messages**

### Pull Request Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Performance improvement
- [ ] Other (please describe)

## Testing
- [ ] Tested locally
- [ ] Added/updated tests
- [ ] Documentation updated

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Comments added for complex code
- [ ] Documentation updated
- [ ] No breaking changes (or clearly documented)
```

### Review Process

1. **Automated checks** must pass
2. **Code review** by maintainers
3. **Testing** in different environments
4. **Documentation review** for accuracy
5. **Final approval** and merge

## 📚 Development Resources

### Project Structure
```
cursor-memory-bank/
├── docs/                 # Documentation
├── examples/             # Usage examples
├── memory-bank/          # Core Memory Bank files
├── rules/                # Cursor rules
├── custom_modes/         # Custom mode configurations
└── assets/               # Images and other assets
```

### Key Files
- `README.md` / `README_ru.md` - Main project documentation
- `CHANGELOG.md` - Version history
- `memory-bank/style-guide.md` - Documentation style guide
- `rules/isolation_rules/` - Core rule system

### Useful Commands
```bash
# Verify installation
ls .cursor/rules/isolation_rules/

# Test Memory Bank functionality
# (Open Cursor and type "VAN")

# Check documentation links
# (Use a markdown link checker)
```

## 🌟 Recognition

Contributors will be recognized in:

- **README acknowledgments**
- **Release notes** for significant contributions
- **Contributors list** in the repository
- **Special mentions** for outstanding contributions

## 📞 Getting Help

### Community Support
- **GitHub Discussions**: Ask questions and share ideas
- **Issues**: Report bugs and request features
- **Documentation**: Comprehensive guides and examples

### Maintainer Contact
- Create an issue for bugs or feature requests
- Use discussions for general questions
- Tag maintainers in pull requests for review

## 📄 Code of Conduct

### Our Standards

We are committed to providing a welcoming and inclusive environment for all contributors:

- **Be respectful** and considerate in all interactions
- **Be collaborative** and help others learn and grow
- **Be constructive** in feedback and criticism
- **Be patient** with newcomers and those learning

### Unacceptable Behavior

- Harassment, discrimination, or offensive language
- Personal attacks or trolling
- Spam or off-topic content
- Violation of privacy or confidentiality

### Enforcement

Violations of the code of conduct may result in:
- Warning and guidance
- Temporary suspension from the project
- Permanent ban from the project

Report violations by creating a private issue or contacting maintainers directly.

## 🎯 Contribution Areas

### High Priority
- **Documentation improvements**: Clarity, examples, translations
- **Bug fixes**: Stability and reliability improvements
- **Performance optimizations**: Speed and efficiency improvements
- **Accessibility**: Making the system more accessible to all users

### Medium Priority
- **New features**: Enhancements to existing functionality
- **Integration improvements**: Better IDE integration
- **Testing**: Expanded test coverage
- **Tooling**: Development and build tools

### Future Opportunities
- **Mobile support**: Extending to mobile development workflows
- **Additional IDE support**: Beyond Cursor IDE
- **Advanced AI integration**: Next-generation AI features
- **Enterprise features**: Large-scale deployment support

## 📈 Roadmap Participation

Contributors can influence the project roadmap by:

- **Participating in discussions** about future features
- **Proposing new directions** for the project
- **Contributing to strategic planning** sessions
- **Providing feedback** on proposed changes

---

Thank you for contributing to Cursor Memory Bank! Your efforts help make AI-assisted development better for everyone.

## 🔗 Quick Links

- [Project Repository](https://github.com/your-username/cursor-memory-bank)
- [Documentation](docs/)
- [Issues](https://github.com/your-username/cursor-memory-bank/issues)
- [Discussions](https://github.com/your-username/cursor-memory-bank/discussions)
- [Releases](https://github.com/your-username/cursor-memory-bank/releases)