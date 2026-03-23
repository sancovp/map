# Contributing to Map

Thank you for your interest in contributing to Map! This document provides guidelines and instructions for contributing.

## Pull Request Guidelines

- **Fork the repository** and create feature branches using the format: `feature/description`
- **PR description** must explain *why* the change is needed, not just *what* was changed
- **Link related issues** in the PR description using keywords (e.g., "Fixes #123")
- **Require review** before merging - all PRs need at least one approval

## Code Style

### Python
- Follow [PEP 8](https://pep8.org/) style guidelines
- Use 4-space indentation (no tabs)
- Maximum line length: 88 characters (Black default)

### Functions
- Use descriptive, lowercase names with underscores (e.g., `calculate_total`)
- All functions must have docstrings explaining purpose, arguments, and return values

### Type Hints
- Type hints are encouraged for function parameters and return values
- Use `from __future__ import annotations` for forward references

## Testing

- **All new code requires tests** using pytest
- Test files must be located in the `tests/` directory
- Test file naming: `tests/test_*.py`
- Test class naming: `Test*`
- Test function naming: `test_*`

### Running Tests

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=map
```

### Coverage Target
Write meaningful tests that verify behavior. We aim for meaningful coverage, not vanity percentages.

## Commit Messages

Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>(<scope>): <description>

[optional body]
[optional footer]
```

### Types

| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation changes |
| `test` | Adding or updating tests |
| `refactor` | Code refactoring |
| `chore` | Maintenance tasks |

### Examples

```
feat(parser): add support for quoted strings
fix(eval): handle division by zero in special forms
docs(readme): update installation instructions
```

## Development Setup

### Prerequisites

- Python 3.11 or higher
- pip

### Installation

```bash
# Clone your fork
git clone https://github.com/your-username/map.git
cd map

# Install in development mode with dev dependencies
pip install -e ".[dev]"

# Run tests to verify setup
pytest
```

### Code Quality

We recommend running linting before submitting PRs:

```bash
# Format code (if using pre-commit)
black .

# Check linting
ruff check .
```

## Getting Help

- Open an issue for bugs or feature requests
- Join discussions on the project repository

Thank you for contributing to Map!
