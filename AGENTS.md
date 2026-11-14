# Danger | AIONIA multi-agent game production

## Role routing
- User speaks to **aionia-director** (OpenAI GPT-6.1 Sol high). Director owns planning, Godot gameplay, integration, testing and reports.
- Director delegates **real visual asset generation** to **gemini-artist** (Gemini). Gemini handles sprite art only, not Godot engineering.
- Director may delegate independent checks to **qa-reviewer**. All testing statements require evidence.
- Image generation model is configured via `experimental.image_generate`. If unavailable, mark BLOCKED. A model that describes an image has not produced a PNG.

## Initial reading order
1. `README.md`, `docs/SETUP.md`
2. `docs/specs/writing-block.md` (original design brief, written for **a different existing repo**)
3. `docs/aionia/REFERENCE_INDEX.md`, `docs/aionia/AIONIA_STANDARD.md`, `docs/aionia/CHARACTER_REFERENCES.md`, `docs/aionia/REGRESSION_STANDARD.md`
4. `docs/production/mission_plan.md`, `docs/production/asset_manifest.md`, `docs/production/test_plan.md`
5. `project.godot`, `scenes/`, `scripts/` and any new assets

## Safety and identity
- This repo is NEW. Never assume that `scripts/campaign_world.gd`, `campaign.json`, existing six-hero assets, etc. exist here merely because the design brief mentions them. The source game is `kaansavukduran/aion_endless_run`; read only for architectural background unless provenance and license permit explicit reuse.
- AIONIA lore must respect ANA / YEREL / OYUN / ALTERNATIF / TASLAK. New proposed characters/biomes are TASLAK until approved. Existing Aion, Melun Bilge Kurt, Kutsanmış Cahil Kuzu, Baykuş Ömer, Tavşan Emre, Tavşan Eren stay distinct.
- Visual source files and reference status are not proven simply by a URL or filename. Inspect actual image before deriving a sprite sheet. Public repository: do not mirror private Drive contents, unpublished artwork, or credentials into git without confirmation.
- Inspired by rich run-and-gun level design, never copy Metal Slug copyrighted assets, maps, sound, or characters.
- No GitHub main merge/push, release, deployment, secrets, paid API activation or Cloud billing changes without explicit approval.
- Use stable IDs; verify no fake animation frames, cropped UI, unusable mobile controls, broken save data, duplicated rescue rewards, or regressions.
- Read fresh Drive standard when access exists; repo snapshot is fallback, not authoritative. Record revision and actual access status.

## Definition of done
Implement in incremental playable slices. Test real behavior. Separate code-written, runtime-tested, browser-tested, sprite-generated, and unverified status. Keep `reports/progress.md` current.
