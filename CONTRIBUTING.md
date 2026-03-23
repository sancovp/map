# Contributing to Map

Thank you for your interest in contributing to Map! This document provides guidelines and instructions for contributing.

## Pull Request Guidelines

- **Fork and branch**: Create a feature branch from `main` using the format `feature/description`
- **PR description**: Explain the *why* behind your changes, not just the *what*
- **Link issues**: Reference any related issues in your PR description
- **Reviews required**: All PRs must be reviewed and approved before merging

## Code Style

### Python
- Follow [PEP 8](https://www.python.org/dev/peps/pep-0008/) style guidelines
- Use 4-space indentation (no tabs)
- Maximum line length: 88 characters (Black default)

### Functions
- Use descriptive, snake_case names (e.g., `calculate_attention`, not `calc`)
- All functions must have docstrings
- Type hints are encouraged for function parameters and return values

```python
def process_input(data: str, options: dict) -> list[str]:
    """Process input data according to options.
    
    Args:
        data: Raw input string to process
        options: Dictionary of processing options
        
    Returns:
        List of processed strings
    """
    pass
```

## Testing

- All new code must include tests
- Test files should be located in `tests/test_*.py`
- Use [pytest](https://docs.pytest.org/) as the test framework
- Run tests with: `pytest`
- Coverage target: Write meaningful tests that verify behavior, not vanity coverage

## Commit Messages

Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>(<scope>): <description>
```

### Types
- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation changes
- **test**: Adding or updating tests
- **refactor**: Code refactoring without behavior change
- **chore**: Maintenance tasks, dependencies, etc.

### Examples
```
feat(core): add attention mechanism for token weighting
fix(parser): handle empty expressions correctly
docs(readme): update installation instructions
test(eval): add tests for special forms
```

## Development Setup

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd map
   ```

2. Create a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. Install the package with development dependencies:
   ```bash
   pip install -e ".[dev]"
   ```

4. Run tests:
   ```bash
   pytest
   ```

## Getting Help

If you have questions or need help, feel free to open an issue for discussion.
