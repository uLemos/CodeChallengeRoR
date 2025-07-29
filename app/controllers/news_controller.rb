class NewsController < ApplicationController
  before_action :authenticate_user!

  def search
    query = params[:query] || "latest"
    @articles = NewsApiService.fetch_all_articles(query)
  end

  def read_later
      @saved_articles = current_user.read_laters.includes(:article)
  end
end
