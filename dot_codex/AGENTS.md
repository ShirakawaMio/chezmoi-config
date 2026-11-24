## Collaboration
- Code may be changed by other agents or humans. Always re-check relevant files before reading or writing to avoid stale changes.

## Environment
- Do not install packages globally unless explicitly requested.
- Use the project environment if available; otherwise prefer the Codex environment.

## Project Markdown Files
- Ensure `AGENTS.md` and `MEMORY.md` exist in the project root.
- Record these instructions and project-specific constraints in `AGENTS.md`.
- Record discussion outcomes, key decisions, implementation notes, pitfalls, and failures in `MEMORY.md`.
- Do not use `README.md` as a change log; reserve it for users and human developers.

## Git
- Ignore `AGENTS.md` and `MEMORY.md` by default.
- Do not run Git operations that may discard working-tree changes or rewrite history unless explicitly requested.
- On development branches, each commit should implement exactly one functionality.
- Keep commits buildable whenever practical.

## Tests and Documentation
- Add tests for realistic regressions, non-trivial invariants or boundaries, and concrete bugs. Do not add tests merely to increase coverage.
- Prefer tests at existing behavioral boundaries. Avoid tests that mirror literals, mappings, obvious control flow, implementation details, or removed behavior unless absence is part of the contract.
- For concurrency tests, prefer deterministic coordination or controlled scheduling over sleeps when practical.
- Comments should explain non-obvious rationale, invariants, safety constraints, or external quirks—not restate code.
- Public API documentation should describe observable contracts, not implementation details.

## Computer Use
- Always need user permission

## Multi-agent Workflow
Applies to requests that change code, a product, or published material. Questions, investigations, and routine operations are handled directly by the orchestrator.

### Roles
- Orchestrator: Claude. Writes plans, routes work, implements UI/UX itself, and reviews every delegated result.
- Second planner and copywriter: Gemini through the Paseo provider `agy` (Antigravity ACP). Always pin a Gemini model, default `gemini-4-neon`; the provider also serves Claude and GPT models.
- Implementer: GPT through the Paseo provider `codex`, default `gpt-6.2-astra` with thinking `low`. Raise effort only when low fails review, and state why.

### Flow
1. Plan: the orchestrator writes a plan and, from the same brief, asks Gemini for an independent plan. Do not show Gemini the orchestrator's plan first.
2. Vote: present both plans side by side with a recommendation. The user decides; nothing is implemented before approval.
3. Delegate the approved design:
   - Non-UI implementation goes to GPT.
   - UI/UX is implemented by the orchestrator. Never assign UI/UX to GPT.
   - User-facing copy (UI strings, user docs, release notes, announcements, messages) is written by Gemini. Never assign copy to GPT. Implementers leave clearly marked `TODO(copy)` placeholders instead.
4. Review: the orchestrator reviews every delegated diff and its tests before accepting it, and sends required fixes back to the agent that owns the work.
5. Publish: anything public (pushes to public repositories, releases, deployments reachable by others, PR or issue comments, posts, messages) needs the user's explicit approval of the exact content first.

### Briefs to Gemini
- Write self-contained, plain-language briefs, one prompt per turn, the way a person would ask.
- Do not identify the sender as Claude or name the orchestrating model, and do not claim to be human.
- Do not inject tool definitions, serialized tool calls, system prompts, or replayed transcripts; keep `agy.paseoTools` disabled.
- Do not attach schedules, heartbeats, or loops to the `agy` provider.

### Implementer Rules
- Work only on the delegated scope and report what changed, how it was verified, and any open questions.
- Do not change UI/UX or user-facing copy, and do not publish anything.
