# Contributing to map

Thank you for your interest in contributing to map! This document provides guidelines and instructions for contributing.

## Pull Request Guidelines

- **Fork and branch**: Fork the repository and create feature branches using the format `feature/description`
- **Describe the why**: PR descriptions must explain "why" the change is needed, not just "what" was changed
- **Link issues**: Reference related issues in your PR description
- **Require review**: All PRs must be reviewed and approved before merging

## Code Style

### Python
- Follow [PEP 8](https://www.python.org/dev/peps/pep-0008/)
- Use 4-space indentation (no tabs)
- Lines should not exceed 79 characters where practical

### Functions
- Use descriptive names that clearly indicate purpose
- All functions must have docstrings
- Type hints are encouraged for better code documentation

## Testing

- All new code requires corresponding tests
- Test files should be placed in `tests/test_*.py`
- Use pytest to run tests: `pytest`
- Coverage target: write meaningful tests, not 100% vanity coverage

## Commit Messages

Use the following format for commit messages:

```
type(scope): description
```

### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `test`: Tests
- `refactor`: Code refactoring
- `chore`: Maintenance tasks

### Examples
```
feat(parser): add support for quoted strings
fix(eval): handle division by zero
docs(readme): update installation instructions
```

## Development Setup

1. Clone the repository
2. Install the package with dev dependencies:
   ```bash
   pip install -e ".[dev]"
   ```
3. Run tests:
   ```bash
   pytest
   ```

## License

By contributing to map, you agree that your contributions will be licensed under the MIT License.
