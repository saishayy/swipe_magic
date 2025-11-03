# Contributing to swipe_magic 🎉

First off, thank you for considering contributing to swipe_magic! It's people like you that make swipe_magic such a great tool. 🙏

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [How Can I Contribute?](#how-can-i-contribute)
- [Style Guidelines](#style-guidelines)
- [Commit Messages](#commit-messages)
- [Pull Requests](#pull-requests)
- [Issue Reporting](#issue-reporting)
- [Release Process](#release-process)

## 📜 Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code. Please report unacceptable behavior to the project maintainers.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.16.0)
- Dart SDK (>=2.17.5)
- Git

### Development Setup

1. **Fork the repository**
   ```bash
   # Fork the repo on GitHub, then clone your fork
   git clone https://github.com/your-username/swipe_magic.git
   cd swipe_magic
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   cd example && flutter pub get
   ```

3. **Verify your setup**
   ```bash
   flutter analyze
   flutter test
   cd example && flutter run
   ```

## 🤝 How Can I Contribute?

### 🐛 Reporting Bugs

Before creating bug reports, please check existing issues as you might find that the problem has already been reported. When you are creating a bug report, please include as many details as possible:

- Use a clear and descriptive title
- Describe the exact steps to reproduce the problem
- Provide specific examples to demonstrate the steps
- Describe the behavior you observed and what behavior you expected
- Include screenshots if helpful
- Provide environment details (Flutter version, platform, etc.)

### ✨ Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

- Use a clear and descriptive title
- Provide a detailed description of the suggested enhancement
- Explain why this enhancement would be useful
- List any alternatives you've considered

### 🔧 Code Contributions

1. **Find an issue to work on**
   - Look for issues labeled `good first issue` for beginners
   - Check `help wanted` issues for intermediate contributors
   - Comment on the issue to let others know you're working on it

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/your-bug-fix
   ```

3. **Make your changes**
   - Write clean, readable code
   - Add tests for new functionality
   - Update documentation as needed

4. **Test your changes**
   ```bash
   # Run analysis
   flutter analyze
   
   # Format code
   dart format .
   
   # Run tests
   flutter test
   
   # Test example app
   cd example && flutter run
   ```

5. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat: add awesome new feature"
   ```

6. **Push and create a Pull Request**
   ```bash
   git push origin feature/your-feature-name
   ```

## 🎨 Style Guidelines

### Dart Code Style

We follow the official [Dart style guide](https://dart.dev/guides/language/effective-dart/style). Key points:

- Use `dart format` to format your code
- Follow naming conventions:
  - `camelCase` for variables, functions, and parameters
  - `PascalCase` for classes, enums, and typedefs
  - `snake_case` for file names
- Prefer `const` constructors when possible
- Use trailing commas for better git diffs
- Add documentation comments for public APIs

### Example:
```dart
/// A widget that displays swipeable cards.
///
/// This widget allows users to swipe cards in different directions
/// and provides callbacks for each swipe action.
class SwipeCards extends StatefulWidget {
  /// Creates a [SwipeCards] widget.
  const SwipeCards({
    super.key,
    required this.matchEngine,
    required this.itemBuilder,
    required this.onStackFinished,
    this.itemChanged,
    this.upSwipeAllowed = false,
    this.fillSpace = true,
  });

  /// The engine that controls the card matching logic.
  final MatchEngine matchEngine;
  
  // ... rest of the implementation
}
```

### Documentation Style

- Use triple-slash comments (`///`) for public APIs
- Provide examples in documentation when helpful
- Keep documentation concise but complete
- Use proper markdown formatting in doc comments

## 📝 Commit Messages

We use [Conventional Commits](https://conventionalcommits.org/) for commit messages:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types:
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `build`: Changes that affect the build system or external dependencies
- `ci`: Changes to CI configuration files and scripts
- `chore`: Other changes that don't modify src or test files

### Examples:
```
feat: add custom swipe tags support
fix: resolve animation glitch on iOS
docs: update README with new examples
test: add unit tests for MatchEngine
```

## 🔄 Pull Requests

### Before Submitting

- [ ] Read and follow all instructions in the PR template
- [ ] Update CHANGELOG.md with your changes
- [ ] Bump version in pubspec.yaml if needed
- [ ] Ensure all tests pass
- [ ] Verify example app works with your changes
- [ ] Add/update documentation as needed

### PR Requirements

1. **Quality Checks**: All automated checks must pass
2. **Code Review**: At least one maintainer must approve
3. **Testing**: Include tests for new functionality
4. **Documentation**: Update docs for API changes
5. **Backwards Compatibility**: Avoid breaking changes when possible

### Review Process

1. **Automated Checks**: GitHub Actions will run tests and analysis
2. **Code Review**: Maintainers will review your code
3. **Feedback**: Address any requested changes
4. **Approval**: Once approved, your PR will be merged

## 🐛 Issue Reporting

### Security Issues

Do NOT create a GitHub issue for security vulnerabilities. Instead, please email the maintainers directly.

### Bug Reports

Use the bug report template and include:
- Clear reproduction steps
- Expected vs actual behavior
- Environment details
- Code samples
- Error logs

### Feature Requests

Use the feature request template and include:
- Problem statement
- Proposed solution
- Alternative solutions considered
- API design (if applicable)

## 🚀 Release Process

### Version Numbering

We follow [Semantic Versioning](https://semver.org/):
- **MAJOR**: Breaking changes
- **MINOR**: New features (backwards compatible)
- **PATCH**: Bug fixes (backwards compatible)

### Release Steps

1. **Update Version**: Bump version in `pubspec.yaml`
2. **Update Changelog**: Add release notes to `CHANGELOG.md`
3. **Create Release**: Tag and create GitHub release
4. **Publish**: Automated publication to pub.dev

## 🔧 Development Tips

### Running Tests
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/specific_test.dart
```

### Debugging
```bash
# Run example app in debug mode
cd example
flutter run --debug

# Enable Flutter inspector
flutter run --debug --dart-define=flutter.inspector.structuredErrors=true
```

### Performance Profiling
```bash
# Profile the example app
cd example
flutter run --profile --dart-define=flutter.inspector.structuredErrors=true
```

## 🆘 Getting Help

- **GitHub Discussions**: Ask questions and get help from the community
- **Issues**: Report bugs or request features
- **Documentation**: Check the README and pub.dev documentation

## 🎯 Good First Issues

New contributors should look for issues labeled:
- `good first issue`: Perfect for newcomers
- `help wanted`: Community help needed
- `documentation`: Documentation improvements

## 📚 Additional Resources

- [Flutter Contributing Guide](https://github.com/flutter/flutter/blob/master/CONTRIBUTING.md)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [Conventional Commits](https://conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)

## 🙏 Recognition

Contributors will be recognized in:
- GitHub contributors list
- CHANGELOG.md for significant contributions
- Release notes for major features

Thank you for contributing to swipe_magic! 🎉