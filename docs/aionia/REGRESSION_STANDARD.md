# AION Endless Run regression checklist adopted for Danger

Live source: https://docs.google.com/document/d/1cpr6yIwVOq2F9rQBlG1sSvFf0Wu9Iir0lJ_KDnqA5lE/edit
- Keep full applicable AER issue registry, not just AER-001..012; inspect live file for exact case IDs.
- AER-005: needless scrollbars, clipped title/buttons, crowded result panels. Fix layout, don't merely hide scrollbars.
- AER-013: gamepad-only start, play, pause, settings, results and restart; focus and disconnect/reconnect.
- AER-014: balanced mobile button geometry and stroke/spacing; multitouch and different orientations.
- AER-015: Chrome and other browser load/reload and cache/version reliability.
- Test no cropped world/controls, no audio unlock regression, sensible pixel scale, touch and keyboard concurrency.
- This new Danger game does not inherit verified successes from the other repo. Test status initially NOT TESTED.
