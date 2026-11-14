# AIONIA implementation standard | short verified excerpt, not full authoritative source

Source: https://docs.google.com/document/d/16jj2cwbm8SiVWqDy3N3dzqxTlLoK7JR2_aH6hl4noWY/edit
Observed: AIONIA v1.7, 13 November 2026. Live source overrides this project note.

- Brand: Fragaria Interactive. Fiction universe: AIONIA. No mandatory separate Fragaria Games sub-brand.
- Game feel: cute + profound + epic. Readable, crisp, hand-authored-feeling pixel art; coherent silhouettes, grid, light, scale, palette and animation.
- Canon tiers: ANA, YEREL, OYUN, ALTERNATIF, TASLAK. Newly invented lore stays TASLAK.
- Keep validated existing character designs and distinctive abilities. No identity substitutions. Unapproved model sheets are not final sprite designs.
- Godot is appropriate for this specific game, not mandatory for every AIONIA product.
- Deliver in gates: sources -> design -> playable vertical slice -> content -> QA -> verified build.
- Real UI controls must fit screens without clipping, overlays or unnecessary internal scrollbars. Never hide broken layout with invisible scrollbars or tiny font.
- Test mobile portrait/landscape, gamepad-only flows, browser startup and reload, visual pivot and physical collision.
- Track PASS/FAIL/NOT TESTED/BLOCKED with evidence; do not infer FPS or real-device success from static code.
