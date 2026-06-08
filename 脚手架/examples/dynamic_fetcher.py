"""Dynamic Scrapling Fetcher（动态抓取器） example.

Use this when the target page needs JavaScript（脚本） rendering.
"""

from __future__ import annotations

import argparse

from scrapling.fetchers import DynamicFetcher


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("url")
    parser.add_argument("selector", nargs="?", default="title::text")
    args = parser.parse_args()

    page = DynamicFetcher.fetch(args.url, headless=True, network_idle=True)
    values = page.css(args.selector).getall()
    for value in values:
        print(value)


if __name__ == "__main__":
    main()
