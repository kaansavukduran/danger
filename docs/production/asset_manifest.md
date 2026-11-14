# Visual asset manifest | first Gemini batch

No generated PNG files yet. All items: PLANNED / NOT GENERATED.

| Stable ID | Asset | Motion | Target | Status |
|---|---|---|---|---|
| AIO-SPR-PLAYER-AION-001 | Aion | idle, run, jump, fall, attack, hurt | source-accurate pixel sprite sheet | BLOCKED_REFERENCE |
| AIO-SPR-FOE-BEETLE-001 | Beetle | idle, walk, attack, hurt, defeated | route introduction | PLANNED |
| AIO-SPR-FOE-GNOME-001 | Gnome | idle, walk, attack, hurt, defeated | route introduction | PLANNED |
| AIO-SPR-NPC-KEEPER-001 | Lantern Keeper | idle, captured, rescued | rescue encounter; TASLAK identity | PLANNED |
| AIO-SPR-ENV-SHORE-001 | Shore | ground/lanterns/crates/platforms | parallax and tiles | PLANNED |
| AIO-SPR-VFX-COMBAT-001 | Combat effects | muzzle, hit, pickup | original effects | PLANNED |

## Must validate before importing
1. See and compare genuine Drive-approved character reference image, not just character names.
2. Generate **real PNG files** via Gemini image generator, not text descriptions. Log exact provider/model and tool response.
3. Check alpha transparency, cell grid consistency, silhouettes, lighting, scale, no backgrounds/labels/extra appendages.
4. For each animation record grid (rows/cols), cell dimensions (px), ordered frames, pivot (px), frame durations (ms), collision region, version, source URL, license/provenance and QA result.
5. Store source under `assets/sources/` when rights permit; ready-to-import files under `assets/sprites/`.
6. A sprite sheet with repeated frames is NOT accepted as unique animation.
7. A failed image tool call = BLOCKED; do not silently substitute another provider or claim completed Gemini art.
