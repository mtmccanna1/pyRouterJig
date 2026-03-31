# UI Refactor TODO

This file captures future UI modernization ideas for `pyRouterJig`, with an emphasis on:

- a more modern visual design
- better usability on tablets
- a possible path toward phone support
- minimizing risk to the existing joint-calculation logic

## Goals

- Preserve the existing woodworking and geometry logic.
- Improve the visual design and overall usability of the app.
- Make the interface more responsive to different screen sizes.
- Support touch-friendly interaction patterns.
- Create a cleaner separation between core calculations and UI code.

## Recommended Direction

Recommended approach:

- Keep the core logic in Python modules such as [router.py](/Users/mikemccanna/Desktop/RouterJig/pyRouterJig/router.py) and [spacing.py](/Users/mikemccanna/Desktop/RouterJig/pyRouterJig/spacing.py).
- Gradually separate UI state, formatting, and rendering concerns out of [qt_driver.py](/Users/mikemccanna/Desktop/RouterJig/pyRouterJig/qt_driver.py) and [qt_fig.py](/Users/mikemccanna/Desktop/RouterJig/pyRouterJig/qt_fig.py).
- Introduce an app-state layer that exposes:
  - user inputs
  - derived values
  - warnings
  - results-table values
  - diagram geometry data
- Build any future UI refresh on top of that state layer.

## Platform Options

### Option 1: Stay in Qt, move toward QML / Qt Quick

Pros:

- Keeps a native app workflow
- Better support for responsive layouts than classic QWidget UI
- Better support for touch interaction, animation, and adaptive controls
- Reuses existing Python backend logic

Cons:

- Requires learning and integrating a second UI paradigm
- Still a meaningful refactor

Best when:

- The goal is a modern desktop/tablet app with possible mobile packaging later

### Option 2: Split into Python engine + web UI

Pros:

- Best long-term fit for phones and tablets
- Easier responsive design
- Easier touch-first interaction model
- Easier future sharing, presets, cloud features, and browser use

Cons:

- Bigger architectural shift
- Requires a frontend stack in addition to Python

Best when:

- True mobile support is a serious long-term goal

### Option 3: Refresh the existing PyQt widget UI

Pros:

- Lowest-risk short-term improvement
- Faster to implement incrementally
- Keeps the existing application structure

Cons:

- Limited phone usability
- Less future-proof than QML or web UI

Best when:

- The immediate goal is a cleaner, more modern desktop app without a major rewrite

## Suggested Phased Plan

### Phase 1: Desktop/Tablet UX Cleanup

- Reorganize the layout so the diagram is the primary visual focus.
- Group inputs into clearer sections such as:
  - Board
  - Bit
  - Spacing
  - Results
- Improve spacing, typography, alignment, and visual hierarchy.
- Replace cramped layouts with card-like or panel-based sections.
- Increase hit targets and control spacing for tablet/touch use.
- Keep direct numeric input, but improve labels and affordances.

### Phase 2: State Separation

- Extract calculation-related display values out of UI rendering code.
- Define a clean app-state object or view-model layer.
- Move formatting logic for result rows and warnings into reusable helpers.
- Reduce the amount of business logic embedded directly inside widget callbacks.

### Phase 3: Interaction Improvements

- Add a collapsible setup panel or drawer.
- Make the results table a clearer dedicated panel.
- Support touch-friendly sliders, segmented controls, and larger buttons.
- Allow selecting a cut in the diagram to inspect related values.
- Link table rows and diagram highlights where useful.

### Phase 4: Responsive Layout

- Desktop:
  - diagram centered
  - controls in side panels
- Tablet:
  - diagram on top or center
  - controls in tabs, drawers, or collapsible panels
- Phone:
  - stacked layout
  - diagram first
  - controls below in grouped sections
  - fewer always-visible controls at once

### Phase 5: Evaluate New Front End

- Decide whether to:
  - continue with improved PyQt widgets
  - migrate to QML / Qt Quick
  - move to a web-based UI
- Prototype one representative screen before full migration.

## UX Recommendations

- Keep one large primary diagram view.
- Add a dedicated “Setup” area for editable parameters.
- Add a dedicated “Results” area for calculated values.
- Prefer progressive disclosure over showing every option at once.
- Replace some text-entry-heavy workflows with:
  - sliders
  - steppers
  - segmented controls
  - presets for common joint setups
- Make the app easier to use without precision typing for every change.

## Mobile/Touch Considerations

- Phone support should be treated as a real product/design effort, not just a visual restyle.
- Touch-first design needs:
  - larger controls
  - simpler screen density
  - fewer simultaneously visible settings
  - clear navigation between setup, diagram, and results
- A phone-ready version will likely require a stronger separation between core logic and UI than the current widget structure.

## Concrete Future Tasks

- Audit [qt_driver.py](/Users/mikemccanna/Desktop/RouterJig/pyRouterJig/qt_driver.py) for UI logic that should move into a state/model layer.
- Audit [qt_fig.py](/Users/mikemccanna/Desktop/RouterJig/pyRouterJig/qt_fig.py) for rendering logic vs. calculation logic that should be separated.
- Define a single source of truth for:
  - current inputs
  - active spacing mode
  - computed setup values
  - diagram annotations
  - warnings and unsupported cases
- Create wireframes for desktop, tablet, and phone layouts.
- Prototype a modernized results panel first.
- Prototype a modernized setup panel second.
- Evaluate whether QML or web UI is the better long-term destination.

## Good First Implementation Slice

If future work starts incrementally, begin with this:

1. Refactor results-table calculations into a dedicated view-model/helper layer.
2. Reorganize the existing PyQt layout into clearer grouped panels.
3. Improve spacing, typography, and control sizing.
4. Make the layout adapt better to narrower windows.
5. Then decide whether to continue with PyQt widgets or migrate to QML/web.

## Suggested Future Prompt

If you want to resume this later, a good prompt would be:

“Use `TODO_UI_REFACTOR.md` as the plan and start implementing Phase 1 of the UI modernization, beginning with a cleaner desktop/tablet layout while preserving existing functionality.”
