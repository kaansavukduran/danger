# Danger production plan: new game based on Mission 1 brief

Source: docs/specs/writing-block.md (unmodified). Its instructions assume a pre-existing aion_endless_run game. Danger is empty and independent; do not claim existing hero assets, boss systems or locales are implemented.

## Slice 0: foundation (this setup change)
- Repo, agents, original brief, live reference index, art manifest, test plan, minimal playable Godot prototype, honest progress report.
- No final character sprite without actual image reference.

## Slice 1: first genuinely playable checkpoint
- Shore -> Quay short mission, player movement+jump+fire, two foes, rescue interaction, collectible, clear goal.
- Placeholder vector characters are allowed only as explicitly tagged DEVELOPMENT PLACEHOLDERS.
- Gemini first batch: one visually verified hero movement set, two distinct foes, one NPC, consistent environment tiles. Each asset requires actual PNG and metadata.
- Test Godot headless + screenshot + manual playtest if environment supports them.

## Slice 2: richer first section
- Enrich initial shore/quay with lantern activation, environmental interactions, secret cache and tutorial-by-playing; add save/checkpoint.
- Verify controls for six heroes once six identity-accurate sprite sheets and mechanics actually exist.

## Slice 3: route A (water), B (terrace), C (roots)
- Route split + second fork; at least six planned encounters and two secrets per route, distinct mechanics, NPC and mini-boss.
- Each region undergoes unit, visual, input and playthrough QA before next one.

## Slice 4: full content targets from original specification
- 17 distinct normal enemy types, four heavy machines, six NPC roles, three route minibosses, nine special weapons, >=8 upgrades, >=3 driveable vehicles and a 3-phase Root Engine boss.
- 43 rescue points across union of routes as specified; per-route expected 22/23/24.
- >=50 meaningful new animation groups and aspirational >=500 independently drawn frames. Never count copied/recolored frames.
- 9-13 minute path target requires measured playthrough, not theoretical estimate.

## Delivery gates
1. Source/auth/licensing verified
2. Game core playable and tested
3. Images actually generated and approved
4. Routes playable
5. Regression + browser + mobile + gamepad verified
6. Separate user approval for GitHub main/release/deployment

Never mark a target as implemented merely because its description exists.
