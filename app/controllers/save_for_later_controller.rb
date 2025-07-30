class SaveForLaterController < ApplicationController
  before_action :authenticate_user!
  def create
    article = Article.find_by(url: params[:url])

    unless article
      article = Article.create(title: params[:title], url: params[:url], source_name: params[:name])
    end

    if current_user.read_laters.exists?(article_id: article.id)
      flash[:alert] = "You have already saved this article for later!"
    else
      current_user.read_laters.create(article: article)
      flash[:notice] = "Article saved for later!"
    end

    redirect_to search_news_index_path(query: params[:query])
  end
end
