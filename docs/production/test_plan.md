# Test plan

## Environment gates
- G0: Godot 4.6.3 executable present? NOTE: NOT TESTED in OpenCode Cloud.
- G1: Headless project import / script parse / scene load.
- G2: Real rendered screenshots at desktop and mobile-size dimensions.
- G3: Keyboard movement, jump, fire, collisions, enemy hit, rescue, collectible, victory, restart.
- G4: Visual atlas quality, PNG alpha, matching pivots and frame counts.
- G5: Branching routes once implemented; no inaccessible segments with six distinct abilities.
- G6: Checkpoint/reward deduplication, pause, saving, input remapping.
- G7: Browser export first load, Chrome/Firefox reload, cache and asset fetching.
- G8: Touch multitouch and physical gamepad end-to-end (NOT TESTED until hardware available).
- G9: Performance FPS/memory only if measured.

Every test row must report PASS / FAIL / NOT TESTED / BLOCKED, environment, command/action, evidence path. Startup import PASS is not playthrough PASS. Never declare complete based on syntax checks only.
