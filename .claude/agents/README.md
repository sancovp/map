# MAP STARSYSTEM Agents

Simple agent directives for working in the MAP STARSYSTEM.

## What These Are

These are **directive files** that GNOSYS uses when spawning agents via Task tool. They're not executable scripts - just instructions for what the agent should do.

## Available Agents

### starship-pilot.md
General development agent. Works in MAP codebase, uses STARSYSTEM MCPs, manages worktrees.

### test-validator.md
Test specialist. Runs test suite, tracks quality metrics, validates coverage.

### release-manager.md
Release coordinator. Prepares releases, validates gates, monitors CICD, manages deployments.

## How GNOSYS Spawns These

```python
# GNOSYS spawns an agent by reading the directive file
Task(
    subagent_type="general-purpose",
    name="starship-pilot-MAP",
    prompt=Read("/tmp/MAP/.claude/agents/starship-pilot.md"),
    description="MAP development work"
)
```

The agent automatically has:
- STARSYSTEM MCPs (via sancrev - starlog, starship, waypoint)
- SendMessage tool (reports to GNOSYS/team-lead)
- All standard Claude Code tools

## Architecture

**STARSYSTEM** (separate from CAVE):
- starlog - Session tracking
- starship - Flight configs
- waypoint - Workflow execution
- Works in `/tmp/MAP` and worktrees

**Communication**:
- Agents report to GNOSYS (their spawner) via SendMessage
- NOT to Conductor or CAVE
- Agent → GNOSYS, not Agent → Conductor

## Git Worktrees

- `/tmp/MAP` - master (stable)
- `/tmp/MAP-dev` - development (active work)
- `/tmp/MAP-staging` - pre-release
- `/tmp/MAP-prod` - production releases

## CICD Integration

Agents can trigger/monitor GitHub Actions:
- Pipeline: https://github.com/sancovp/map/actions
- Docker: ghcr.io/sancovp/map
- Release tags (v*) trigger Docker builds

---

**Keep it simple.** These are just directive files. GNOSYS spawns agents via Task tool, agents use STARSYSTEM MCPs, agents report back via SendMessage.
