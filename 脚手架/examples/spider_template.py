"""Scrapling Spider（爬虫框架） template for paginated targets."""

from __future__ import annotations

from scrapling.spiders import Response, Spider


class ExampleSpider(Spider):
    name = "example"
    start_urls = ["https://example.com/"]
    concurrent_requests = 4
    download_delay = 1.0

    async def parse(self, response: Response):
        yield {
            "url": response.url,
            "title": response.css("title::text").get(),
            "source_quality": "其他渠道",
        }

        next_page = response.css("a.next::attr(href)").get()
        if next_page:
            yield response.follow(next_page)


if __name__ == "__main__":
    result = ExampleSpider(crawldir="./try/example_spider").start()
    result.items.to_jsonl("try/example_spider_items.jsonl")
