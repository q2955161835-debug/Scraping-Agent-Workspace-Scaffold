---
name: external-skills-hub
description: Route Codex to local custom skills under D:\2Folder\skills when native capabilities are insufficient or the user asks for external/local/custom skills. Contains a compact one-line catalog of available external skills and their selection criteria. After choosing a skill, read only that skill's SKILL.md and referenced resources; never recursively inject the external library.
---

# External Skills Hub

Use this skill when built-in Codex capabilities are not enough and the task may benefit from a custom skill in `D:\2Folder\skills`.

This skill is a router, not a substitute for the target skill.

## Procedure

1. Prefer native or already-loaded Codex capabilities when they fully cover the task.
2. Use the catalog below to choose the smallest useful set of external skills, usually one.
3. After choosing, read the selected skill's `SKILL.md` from `D:\2Folder\skills` before acting.
4. Follow that selected skill's own instructions and load referenced files only when relevant.
5. If this catalog is stale or ambiguous, check `D:\2Folder\skills\doc\SKILLS_HUB.md` or `D:\2Folder\skills\doc\skills说明书.md`.

## Selection Catalog

Use this catalog only to choose the next skill. After choosing, read that skill's `SKILL.md` before acting.

### Search, Browsing, Extraction

- `multi-search-engine` - plan search strategy, compare engines, and build auditable search queries.
- `opencli` - operate supported logged-in platforms, feeds, hot lists, posts, and account-scoped actions.
- `scrapling` - extract content from arbitrary pages, lists, tables, pagination, and anti-bot situations.
- `find-skills` - discover, evaluate, install, or document missing skills.

### Conversion, Documents, Media

- `markitdown-skill` - convert PDF, Office, web pages, images, audio, and YouTube content to Markdown/text.
- `anthropic-skills/skills/docx` - reference workflow for Word document creation, reading, and editing.
- `anthropic-skills/skills/pdf` - reference workflow for PDF extraction, manipulation, and analysis.
- `anthropic-skills/skills/pptx` - reference workflow for PowerPoint deck creation and editing.
- `anthropic-skills/skills/xlsx` - reference workflow for spreadsheet creation, formulas, and analysis.
- `anthropic-skills/skills/doc-coauthoring` - structured coauthoring for documentation drafts and revisions.

### Design, UI, Frontend Quality

- `better-icons` - find and select icon assets for product UI or project branding.
- `design-md` - produce structured design documents and implementation-ready design specs.
- `impeccable` - audit and polish frontend UI quality with detailed visual/interaction checks.
- `taste-skill` - make high-level product taste, visual direction, and design judgment calls.
- `ui-skills/skills/canvas-design` - create static visual compositions and design canvases.
- `ui-skills/skills/design-lab` - explore design alternatives and visual experiments.
- `ui-skills/skills/frontend-design` - guide polished web layout and frontend interface decisions.
- `ui-skills/skills/interaction-design` - refine user flows, states, gestures, and interaction behavior.
- `ui-skills/skills/interface-design` - design concrete UI screens, controls, hierarchy, and component layout.
- `ui-skills/skills/swiftui-ui-patterns` - apply SwiftUI-specific interface and component patterns.
- `ui-skills/skills/ui-ux-pro-max` - broad UI/UX review for product quality and usability tradeoffs.
- `ui-skills/skills/wcag-audit-patterns` - audit accessibility against WCAG-oriented patterns.
- `ui-skills/skills/web-design-guidelines` - apply general web design standards and responsive layout guidance.
- `anthropic-skills/skills/frontend-design` - Anthropic reference guidance for polished frontend artifacts.
- `anthropic-skills/skills/brand-guidelines` - apply Anthropic brand colors, typography, and visual style only.
- `anthropic-skills/skills/theme-factory` - build visual themes for docs, decks, reports, and HTML pages.
- `anthropic-skills/skills/web-artifacts-builder` - build complex Claude-style HTML artifacts.
- `anthropic-skills/skills/webapp-testing` - run Playwright-style checks for local web app behavior.

### Animation and Interactive Frontend

- `gsap-skills/skills/gsap-core` - choose GSAP core APIs for tweens, easing, staggers, and defaults.
- `gsap-skills/skills/gsap-timeline` - sequence complex animations with timelines, labels, and playback controls.
- `gsap-skills/skills/gsap-scrolltrigger` - implement scroll-linked animation, pinning, scrub, and refresh handling.
- `gsap-skills/skills/gsap-plugins` - use GSAP plugins such as Flip, Draggable, Observer, SplitText, SVG, and physics.
- `gsap-skills/skills/gsap-utils` - use `gsap.utils` helpers for mapping, snapping, randomizing, wrapping, and piping.
- `gsap-skills/skills/gsap-react` - integrate GSAP with React or Next.js lifecycle, refs, SSR, and cleanup.
- `gsap-skills/skills/gsap-frameworks` - integrate GSAP with Vue, Nuxt, Svelte, and SvelteKit lifecycles.
- `gsap-skills/skills/gsap-performance` - optimize animation smoothness, transforms, batching, and reduced motion.

### Coding Workflow and Engineering Process

- `cli-anything` - build or validate a CLI wrapper around a GUI app or source repository workflow.
- `superpowers/skills/brainstorming` - clarify vague feature or behavior changes before planning implementation.
- `superpowers/skills/writing-plans` - turn an approved approach into an executable implementation plan.
- `superpowers/skills/executing-plans` - carry out an existing plan with checkpoints and verification.
- `superpowers/skills/systematic-debugging` - debug failures with evidence, hypotheses, and targeted checks.
- `superpowers/skills/test-driven-development` - drive a bugfix or feature through tests first.
- `superpowers/skills/verification-before-completion` - verify work before claiming it is complete.
- `superpowers/skills/requesting-code-review` - prepare completed work for review with focused context.
- `superpowers/skills/receiving-code-review` - process review feedback and verify fixes.
- `superpowers/skills/finishing-a-development-branch` - finish branch work and prepare integration steps.
- `superpowers/skills/using-git-worktrees` - set up or reason about isolated Git worktrees.
- `superpowers/skills/dispatching-parallel-agents` - split independent investigations across parallel agents when allowed.
- `superpowers/skills/subagent-driven-development` - coordinate subagent-based implementation when allowed.
- `superpowers/skills/using-superpowers` - understand when and how to invoke Superpowers workflows.
- `superpowers/skills/writing-skills` - create, revise, or validate skill files and workflows.

### CAD, Manufacturing, Robotics

- `cad` - generate or modify STEP-first build123d/Python CAD parts and assemblies.
- `cad-explorer` - open and inspect CAD or robot-description files in the local CAD Explorer GUI.
- `render` - render CAD/3D assets for visual inspection and presentation.
- `step-parts` - find or prepare standard STEP parts for CAD assemblies.
- `sendcutsend` - preflight SendCutSend manufacturing upload files and fabrication constraints.
- `urdf` - create or validate URDF robot description files.
- `srdf` - create or validate SRDF semantic robot configuration files.
- `sdf` - create or validate SDF simulation/world description files.

### Language, Learning, Statistics

- `japanese-cjt4-coach` - coach Japanese CJT4 study, drills, and review.
- `lang-drill-coach` - build general language drills, error review, and spaced repetition.
- `statistical-analysis` - choose statistical tests, power analysis, and APA-style reporting.

### Image and Visual Generation

- `image2` - local image generation/editing workflow when native image tools are insufficient.
- `imagegen` - local image generation/editing workflow alternative for raster assets.
- `anthropic-skills/skills/algorithmic-art` - create p5.js generative or algorithmic art.
- `anthropic-skills/skills/canvas-design` - create static visual designs as Markdown, PNG, or PDF.
- `anthropic-skills/skills/slack-gif-creator` - make Slack-optimized animated GIFs.

### Anthropic and Agent Skill References

- `anthropic-skills/skills/claude-api` - build or debug Anthropic Claude API and SDK integrations.
- `anthropic-skills/skills/mcp-builder` - design and implement MCP servers using Anthropic reference guidance.
- `anthropic-skills/skills/skill-creator` - reference Anthropic Agent Skills structure and evaluation patterns.
- `anthropic-skills/skills/internal-comms` - draft internal updates, FAQs, reports, and leadership communications.

## Notes

- Do not recursively load `D:\2Folder\skills`.
- Do not use wildcard entries as routing decisions; choose one listed skill, then read its `SKILL.md`.
- Bundle directories without their own `SKILL.md` are not direct skills; choose the listed child skill.
