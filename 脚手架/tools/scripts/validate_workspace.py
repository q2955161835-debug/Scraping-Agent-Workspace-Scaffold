"""Validate the scaffold structure without requiring Scrapling（网页抓取库）."""

from __future__ import annotations

import argparse
import sys
from pathlib import Path


REQUIRED_FILES = [
    "AGENTS.md",
    "README.md",
    "pyproject.toml",
    ".env.example",
    "doc/项目地图.md",
    "doc/进展记录.md",
    "tools/工具库说明.md",
    "tools/skills/README.md",
    "tools/workspace-scraping/SKILL.md",
    "tools/workspace-scraping/references/channel-playbook.md",
    "tools/workspace-scraping/references/dataset-acceptance.md",
    "templates/standard-scraping-project/doc/项目地图.md",
]

REQUIRED_TOOLS = [
    "tools/scripts/scaffold_project.py",
    "tools/scripts/create_variable_template.py",
    "tools/scripts/validate_workspace.py",
    "tools/scripts/New-ScrapingProject.ps1",
    "tools/scripts/New-VariableTemplate.ps1",
    "tools/scripts/Test-ScrapingWorkspace.ps1",
    "tools/scripts/Link-Skills.ps1",
]


def validate(root: Path) -> list[str]:
    errors: list[str] = []
    for relative in REQUIRED_FILES + REQUIRED_TOOLS:
        if not (root / relative).exists():
            errors.append(f"缺少必需文件：{relative}")

    agents = (root / "AGENTS.md").read_text(encoding="utf-8")
    for phrase in ["禁止制定重复规则", "数据质量分级", "爬取前变量建模"]:
        if phrase not in agents:
            errors.append(f"AGENTS.md 缺少关键规则：{phrase}")

    readme = (root / "README.md").read_text(encoding="utf-8")
    for phrase in ["Scraping Agent Workspace Scaffold", "Scrapling", "快速开始"]:
        if phrase not in readme:
            errors.append(f"README.md 缺少关键内容：{phrase}")

    return errors


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("root", nargs="?", default=".")
    args = parser.parse_args()

    errors = validate(Path(args.root))
    if errors:
        for error in errors:
            print(f"FAIL\t{error}")
        sys.exit(1)
    print("OK\t工作区结构检查通过")


if __name__ == "__main__":
    main()
