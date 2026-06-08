"""Create a blank variable confirmation CSV（逗号分隔值文件）."""

from __future__ import annotations

import argparse
import csv
from pathlib import Path


HEADERS = [
    "变量名",
    "字段含义",
    "单位",
    "数据类型",
    "来源优先级",
    "是否必填",
    "清洗规则",
    "可接受缺失条件",
    "备注",
]


def create_template(project_path: Path, output_name: str) -> Path:
    if not project_path.exists():
        raise FileNotFoundError(f"项目路径不存在：{project_path}")

    doc_path = project_path / "doc"
    doc_path.mkdir(parents=True, exist_ok=True)
    output_path = doc_path / output_name
    if output_path.exists():
        raise FileExistsError(f"变量确认表已存在：{output_path}")

    with output_path.open("w", encoding="utf-8-sig", newline="") as file:
        writer = csv.DictWriter(file, fieldnames=HEADERS)
        writer.writeheader()
        writer.writerow(
            {
                "变量名": "",
                "字段含义": "",
                "单位": "",
                "数据类型": "",
                "来源优先级": "官方>官方新闻>第三方新闻>论文>逆向计算>论坛>其他渠道",
                "是否必填": "",
                "清洗规则": "",
                "可接受缺失条件": "",
                "备注": "",
            }
        )
    return output_path


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("project_path")
    parser.add_argument("--output-name", default="变量确认表.csv")
    args = parser.parse_args()

    print(create_template(Path(args.project_path), args.output_name))


if __name__ == "__main__":
    main()
