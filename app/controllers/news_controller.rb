class NewsController < ApplicationController
  before_action :authenticate_user!

  def search
    query = params[:query] || "latest"
    @articles = NewsApiService.fetch_all_articles(query)
    @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(10)
  end

  def read_later
      @saved_articles = current_user.read_laters.includes(:article).page(params[:page]).per(10)
  end
end
