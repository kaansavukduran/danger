# OpenCode Cloud quick start: Danger

1. Open GitHub repository `kaansavukduran/danger` in OpenCode Cloud.
2. Select branch `feature/aionia-multi-agent-setup` (or merge its PR first). OpenCode reads project `opencode.jsonc`.
3. Confirm **OpenAI** and **Google** provider connections in THIS project. In OpenCode choose `/models` and verify these exact model IDs are offered. Provider connections may not transfer between workspaces.
4. Select primary agent `aionia-director`, then open a **new session** after switching the branch so config loads.
5. Paste this task: `Read AGENTS.md. Audit the repo and Drive reference links. Build the first playable AIONIA vertical slice using GPT for design, Godot and tests. Delegate the first approved sprite sheet batch to gemini-artist; Gemini must call experimental_image_generate and save actual PNG files. If image generation fails, use labeled placeholders and report BLOCKED. Do not push, merge or deploy.`
6. Verify first `reports/progress.md` entry, Godot headless parse, and a real PNG in `assets/sprites/` before treating it as complete.

**Important:** The `experimental_image_generate` tool is experimental and may be unavailable in your Cloud runtime, even though Gemini chat is connected. `gemini-artist` only counts as having generated sprite sheets if a valid image exists on disk. The `google/gemini-3.5-flash` planning model and `google/gemini-3.1-flash-image` image model are separate; check OpenCode's current enabled catalog and update IDs if unavailable. GPT model likewise must be visible in the provider catalog.

**Google Drive:** Cloud agent does not automatically inherit this chat's Drive connector. References are indexed in `docs/aionia/REFERENCE_INDEX.md`; full private Drive contents are intentionally not copied into this public repository. For pixel-accurate continuation, provide approved reference images through a connected Drive tool or an authorized in-repository asset import.

**Scope note:** `docs/specs/writing-block.md` is the unmodified request for expansion of the *existing* `aion_endless_run`. Danger is a new repo; implement as independent Godot game and treat existing-file instructions as provenance targets, not existing files. Begin with a playable vertical slice before escalating to 17 enemies / 500+ unique frames.

**Cloud vs deployment:** Config files and code appearing in GitHub do not prove OpenCode loaded models, generated assets, started Godot, or deployed the game. No deployment has been authorized.
