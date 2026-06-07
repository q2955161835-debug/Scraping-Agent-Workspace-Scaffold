---
name: workspace-scraping
description: 本数据爬取工作区专用技能。Use when Codex works inside D:\1Folder\爬虫work\scrapling数据集合工作区 to create or maintain scraping target projects, build variable confirmation tables, assign channel subagents, choose Scrapling/Excel workflows, organize data folders, or validate final scraped datasets.
---

# Workspace Scraping（工作区爬取）

## Overview

Use this skill only for this data scraping workspace. It turns the root `AGENTS.md`（代理说明文件） into a concrete operating workflow for target projects, reusable tools, variable confirmation, source quality grading, and final data handoff.

## First Actions

- Read root `AGENTS.md`（代理说明文件） before changing project structure or starting collection.
- Check `git status --short --branch` before edits. If the change is structural or broad, create a checkpoint commit first.
- For a new target project, run or mirror `tools/scripts/New-ScrapingProject.ps1`.
- Before scraping, create a blank variable confirmation table with `tools/scripts/New-VariableTemplate.ps1`, then wait for user confirmation.

## Target Project Workflow

1. Create first-level project folder named by scraping target.
2. Create default second-level folders: `doc/`、`旧数据/`、`原始数据/`、`原始文件/`、`try/`.
3. Add extension folders only when the target needs them; document each extension folder in the target project's `doc/目录说明.md`.
4. Build the variable confirmation table before crawler work. Required columns: variable name, meaning, unit, data type, source priority, required flag, cleaning rule, acceptable missing condition, note.
5. Assign channel subagents by source type: official source, official news, third-party news, literature, reverse calculation, weak-source verification, and final aggregation.
6. Store raw structured results in `原始数据/`; store downloaded files or snapshots in `原始文件/`; store temporary experiments in `try/`.
7. Put the newest cleaned dataset in the target project root and archive replaced versions in `旧数据/`.

## Tool Selection

- Use `tools/skills/scrapling` for `Scrapling`（网页抓取库） strategy and fetcher escalation.
- Use `tools/skills/spreadsheets` for `Excel`（表格） templates, validation sheets, and final workbook checks.
- Use `tools/skills/multi-search-engine` for auditable source discovery queries.
- Use `tools/skills/markitdown-skill` for document or web-to-Markdown conversion.
- Use `tools/skills/external-skills-hub` when deciding whether another local skill applies.
- Use `tools/skills/skill-creator` when updating this workspace skill or creating a new workspace-specific skill.

## Scrapling Escalation

- Start with `Fetcher`（基础抓取器） for static pages.
- Move to `DynamicFetcher`（动态抓取器） when JavaScript（脚本） rendering is required.
- Move to `StealthyFetcher`（隐身抓取器） only when the target behavior requires it.
- Use `Spider`（爬虫框架） for 10+ pages, pagination, concurrency, checkpoints, or resume behavior.
- Record fetcher choice, failure signal, retry policy, and source quality level in the target project's `doc/采集策略.md`.

## Reusable Scripts

- `../scripts/New-ScrapingProject.ps1`: create a target project skeleton.
- `../scripts/New-VariableTemplate.ps1`: create a blank variable confirmation CSV（逗号分隔值文件）.
- `../scripts/Test-ScrapingWorkspace.ps1`: check required root files, tool links, and common folder problems.

## References

- Read `references/channel-playbook.md` when a target has multiple source channels or needs subagent assignment.
- Read `references/dataset-acceptance.md` before final handoff or when validating scraped data.
