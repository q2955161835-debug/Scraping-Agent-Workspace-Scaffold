"""Basic Scrapling Fetcher（基础抓取器） example.

Usage:
    python examples/basic_fetcher.py https://example.com "h1::text"
"""

from __future__ import annotations

import argparse

from scrapling.fetchers import Fetcher


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("url")
    parser.add_argument("selector", nargs="?", default="title::text")
    args = parser.parse_args()

    page = Fetcher.get(args.url)
    values = page.css(args.selector).getall()
    for value in values:
        print(value)


if __name__ == "__main__":
    main()
