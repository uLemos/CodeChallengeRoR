class NewsApiService
  require "news-api"

  @@newsapi = nil

  def self.initialize_news_api
    @@newsapi ||= News.new(ENV["NEWS_API_KEY"])
  end

  def self.fetch_top_headlines(query, sources = nil, category = nil, language = "en", country = "us")
    initialize_news_api
    response = @@newsapi.get_top_headlines(
      q: query,
      sources: sources,
      category: category,
      language: language,
      country: country
    )

    response["articles"] if response["status"] == "ok"
  end

  def self.fetch_all_articles(query, sources = nil, domains = nil, from = nil, to = nil, language = "en", sort_by = "relevancy", page = 1)
    initialize_news_api
    response = @@newsapi.get_all_articles(
      q: query,
      sources: sources,
      domains: domains,
      from: from,
      to: to,
      language: language,
      sort_by: sort_by,
      page: page
    )

    response["articles"] if response["status"] == "ok"
  end

  def self.fetch_sources(country = "us", language = "en")
    initialize_news_api
    response = @@newsapi.get_sources(country: country, language: language)
    response["sources"] if response["status"] == "ok"
  end
end
