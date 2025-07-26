class NewsController < ApplicationController
  def search
    query = params[:query] || 'latest'
    @articles = NewsApiService.fetch_all_articles(query)
  end
end
