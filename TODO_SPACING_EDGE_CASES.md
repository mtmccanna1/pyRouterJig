# General TODO

This file is a running list of future work items that do not yet have a committed implementation plan.

## Spacing And Geometry

### Small Dovetail Bit Equal-Width Collapse

Observed issue:

- With a `1/4"` dovetail bit and certain Equal-tab width settings, the diagram can collapse into showing a single dovetail on board A plus many router pass marks, instead of a normal repeating joint pattern.

Reported example:

- Board width: `7.5"`
- Tail board thickness: `3/4"`
- Bit diameter: `1/4"`
- Bit depth: `1/2"`
- Bit angle: `14°`
- Equal spacing mode
- Equal width below about `11/32"` appears to collapse
- Equal width at `11/32"` or above appears to restore a normal layout

Notes:

- This appears to be a spacing/geometry edge case rather than a simple paint bug.
- The Equal-tab width for dovetail bits is not the final visible cut width; the effective cut width is influenced by bit geometry.
- The behavior suggests the Equal-spacing algorithm may be crossing a threshold where the computed layout degenerates into a single centered cut.

Future investigation:

- Reproduce the issue directly from the UI and from a small script using the spacing classes.
- Determine whether the collapse is mathematically intended, a limitation of the current spacing algorithm, or an actual bug.
- Decide whether to:
  - warn the user when Equal width falls into a degenerate range
  - clamp the Equal width slider for affected dovetail-bit setups
  - improve the Equal-spacing algorithm so it can produce a stable multi-cut layout in that range

## Input Constraints

Preferred direction:

- Move away from fully free-form entry for settings that are known to create bad or misleading joint layouts.
- Consider replacing some inputs with constrained dropdown or selector-style controls.
- Disallow known-bad configurations instead of merely allowing them and trying to explain the resulting layout afterward.
- In particular, future UI work should consider constraining:
  - bit diameter
  - bit angle
  - Equal width choices for dovetail-bit setups
- If a configuration is disallowed, the UI should explain briefly why the option is unavailable.

## Suggested Future Prompt

“Use `TODO_SPACING_EDGE_CASES.md` as a general TODO list, and start with the spacing/geometry items related to small-dovetail-bit Equal-width collapse.”
