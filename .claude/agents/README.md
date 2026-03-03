# MAP STARSYSTEM Agents

Specialized agents for autonomous MAP development, testing, and deployment.

## Agent Roster

### 1. starship-pilot-MAP (Development Lead)
**Role:** Primary development coordinator
**Authority:** Flight execution, development workflows
**Workflows:**
- Development in MAP-dev worktree
- Test validation
- CICD deployment coordination

**When to spawn:**
```bash
python3 /tmp/starship-agent-system/spawn_starship.py MAP /tmp/MAP "Development mission"
```

### 2. test-validator-MAP (Test Specialist)
**Role:** Test suite validation and coverage analysis
**Authority:** Test analysis, regression detection
**Workflows:**
- Full test suite execution (210 tests)
- Coverage analysis
- Regression checking

**Thresholds:**
- Minimum pass rate: 60%
- Coverage target: 80%
- Performance baseline: 10s

**When to spawn:**
- On PR submission
- Before releases
- After major refactors

### 3. release-manager-MAP (Release Orchestrator)
**Role:** Release coordination and deployment
**Authority:** Dev/staging deployment (auto), Production (requires approval)
**Workflows:**
- Release preparation (changelog, version bump, tagging)
- CICD pipeline monitoring
- Docker image tracking
- Rollback on failure

**Release Gates:**
- All tests passing
- Coverage above threshold
- No critical bugs
- Changelog updated

**When to spawn:**
- For staging deployments
- For production releases
- For hotfix coordination

## Team Coordination

### Development Flow
```
GNOSYS (Mission Control)
    ↓
starship-pilot-MAP (spawned for feature work)
    ├─→ Develops in MAP-dev worktree
    ├─→ Calls test-validator-MAP for validation
    └─→ Reports progress to GNOSYS
```

### Release Flow
```
GNOSYS (Mission Control)
    ↓
release-manager-MAP (spawned for release)
    ├─→ Validates release gates
    ├─→ Calls test-validator-MAP for final check
    ├─→ Executes release pipeline
    ├─→ Monitors CICD/Docker build
    └─→ Reports to GNOSYS (requires approval for prod)
```

## Spawning Agents via GNOSYS

### Using Task Tool
```python
Task(
    subagent_type="general-purpose",
    team_name="map-development",
    name="starship-pilot-MAP",
    prompt="[Load agent config from .claude/agents/starship-pilot-MAP.json]",
    description="MAP development mission"
)
```

### Agent Configuration
Each agent JSON defines:
- `mcp_requirements`: Required/optional MCPs
- `skills`: Equipped skills and domain
- `capabilities`: What the agent can do
- `workflows`: Defined workflow patterns
- `communication`: How to report to GNOSYS
- `autonomous_mode`: Decision authority and escalation triggers

## Git Worktrees
Agents can navigate between worktrees:
- `/tmp/MAP` - master (stable)
- `/tmp/MAP-dev` - development (active)
- `/tmp/MAP-staging` - staging (pre-release)
- `/tmp/MAP-prod` - production (releases only)

## CICD Integration
Agents interface with GitHub Actions:
- Monitor pipeline: https://github.com/sancovp/map/actions
- Docker registry: ghcr.io/sancovp/map
- Release tags: v* triggers Docker build

## Communication Protocol
All agents report to GNOSYS via message-conductor:
```bash
curl -X POST http://localhost:8080/messages/send \
  -H 'Content-Type: application/json' \
  -d '{
    "from_agent": "starship-pilot-MAP",
    "to_agent": "conductor",
    "content": "Mission status update",
    "priority": 5
  }'
```

## Autonomous Operation
- **starship-pilot-MAP**: Fully autonomous for development
- **test-validator-MAP**: Fully autonomous for testing
- **release-manager-MAP**: Semi-autonomous (prod requires approval)

## Escalation Triggers
Agents escalate to GNOSYS when:
- Test pass rate below threshold
- CICD pipeline failure
- Release gate failure
- Deployment health check failure
- Unexpected errors

---

**System Status:** Operational
**Agent Version:** 1.0.0
**Last Updated:** 2026-03-03
