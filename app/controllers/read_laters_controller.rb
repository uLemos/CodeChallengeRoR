class ReadLatersController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @read_later = current_user.read_laters.find(params[:id])
    @read_later.destroy

    redirect_to read_later_news_index_path, notice: "Article removed from list"
  end
end
