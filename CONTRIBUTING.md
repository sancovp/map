# Contributing to MAP

Thank you for your interest in contributing to MAP (AI-Native Attention Programming Shell)! MAP is a homoiconic Lisp implementation for AI agents. This document provides guidelines and instructions for contributing.

## Pull Request Guidelines

### Workflow

1. **Fork the repository** and create your branch from `main`:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Keep your branch up to date** with the main branch:
   ```bash
   git fetch origin
   git rebase origin/main
   ```

3. **Write clean, self-contained commits** with clear messages.

4. **Push your changes** to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

5. **Open a Pull Request** with a clear title and description.

### PR Description Requirements

Your PR description should include:

- **Summary**: Brief description of what the PR does
- **Motivation**: Why this change is needed
- **Changes Made**: Detailed list of changes
- **Testing**: How you tested the changes
- **Screenshots/Examples**: If applicable
- **Related Issues**: Link to any related issues

### Review Process

1. All PRs require at least one review before merging
2. Address reviewer feedback by pushing additional commits
3. Maintain civil and constructive discussions

### Merge Criteria

- All CI/CD checks pass
- Code follows style guidelines
- Tests pass locally
- Documentation updated if needed
- No merge conflicts

## Code Style Guidelines

### Python Standards (PEP 8)

- Use 4 spaces for indentation
- Limit lines to 88 characters (Black default)
- Use meaningful variable and function names
- Avoid single-letter variable names except in loops

### Docstring Format (Google Style)

```python
def function_name(param1, param2):
    """Short description.

    Longer description if needed, explaining the function's
    purpose and behavior.

    Args:
        param1: Description of param1.
        param2: Description of param2.

    Returns:
        Description of return value.

    Raises:
        ValueError: When this exception is raised.
    """
```

### Naming Conventions

| Type | Convention | Example |
|------|------------|---------|
| Functions/Variables | snake_case | `parse_expression`, `token_list` |
| Classes | PascalCase | `ExpressionNode`, `TokenStream` |
| Constants | UPPER_SNAKE_CASE | `MAX_RECURSION_DEPTH` |
| Private Methods | _leading_underscore | `_validate_token` |

### Import Ordering

```python
# Standard library
import re
from typing import List, Optional

# Third-party packages
import pytest

# Local application
from map.base import Parser
from map.meta import Evaluator
```

## Development Setup

### Requirements

- Python 3.11 or higher
- Git

### Virtual Environment Setup

```bash
# Clone the repository
git clone https://github.com/your-fork/map.git
cd map

# Create virtual environment
python3 -m venv venv

# Activate virtual environment
# On Linux/macOS:
source venv/bin/activate
# On Windows:
venv\Scripts\activate

# Install dependencies
pip install -e ".[dev]"
```

### Running Tests

```bash
# Run all tests
pytest tests/

# Run specific test file
pytest tests/test_map.py

# Run with verbose output
pytest -v tests/

# Run with coverage
pytest --cov=map tests/
```

### Code Formatting

MAP uses standard Python formatting tools. Before committing:

```bash
# Format code with standard tools
black .
isort .
```

## Testing Requirements

### Test File Naming

- Use the pattern `test_*.py`
- Example: `test_parser.py`, `test_evaluator.py`

### Test Class Naming

- Use the pattern `Test*`
- Example: `TestParser`, `TestEvaluator`

### Test Function Naming

- Use the pattern `test_*`
- Example: `test_parse_simple_expression`, `test_evaluate_addition`

### Test Structure

```python
import pytest
from map.base import Parser

class TestParser:
    """Tests for the Parser class."""

    def test_parse_simple_expression(self):
        """Test parsing a simple expression."""
        parser = Parser()
        result = parser.parse("(+ 1 2)")
        assert result is not None

    def test_parse_nested_expressions(self):
        """Test parsing nested expressions."""
        parser = Parser()
        result = parser.parse("(+ 1 (* 2 3))")
        assert result is not None
```

### Coverage Expectations

- New features should include tests
- Bug fixes should include regression tests
- Aim for meaningful tests, not just coverage

## Commit Message Format

### Conventional Commits

MAP follows the Conventional Commits specification:

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Type Values

| Type | Description |
|------|-------------|
| feat | New feature |
| fix | Bug fix |
| docs | Documentation changes |
| style | Formatting, missing semicolons, etc. |
| refactor | Code restructuring without behavior change |
| test | Adding or updating tests |
| chore | Maintenance tasks |

### Scope

Optional scope indicating the affected module:

- `base` - Core parsing and evaluation
- `meta` - Meta-programming features
- `super` - Supercombinators
- `cli` - Command-line interface

### Examples

```
feat(base): add support for quoted expressions

Adds the ability to quote expressions using the 'quote' special form.
This prevents evaluation of the quoted content.

fix(meta): correct variable scoping in let expressions

The let binding was not properly scoped, causing references
to leak into outer scopes.

docs(cli): update README with installation instructions

Closes #42
```

### Rules

- Use imperative mood ("add" not "added")
- Keep the first line under 50 characters
- Capitalize the description
- No period at the end of the first line
- Use the body for explanation when needed

## MAP Project Structure

```
map/
├── base/           # Core parsing and evaluation
├── meta/           # Meta-programming features
├── super/          # Supercombinators
├── __main__.py     # Entry point
└── poetry_system.py # Poetry integration

tests/
└── test_map.py     # Main test suite
```

## Questions?

Feel free to open an issue for questions or discussions about contributing to MAP.
