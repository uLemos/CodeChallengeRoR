class SaveForLaterController < ApplicationController
  before_action :authenticate_user!
  def create
    article_id = params[:id]

    article = Article.find_or_create_by(id: article_id) do |a|
      a.title = params[:title]
      a.url = params[:url]
      a.source_name = params[:name]
    end

    if current_user.read_laters.exists?(article: article)
      flash[:alert] = "You have already saved this article for later!"
    else
      current_user.read_laters.create(article: article)
      flash[:notice] = "Article saved for later!"
    end

    redirect_to search_news_index_path(query: params[:query])
  end
end
