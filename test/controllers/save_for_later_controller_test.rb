require "test_helper"

class SaveForLaterControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @article = articles(:one)
    sign_in @user
  end

  test "should create readlater" do
    ReadLater.where(article_id: @article.id, user_id: @user.id).destroy_all

    assert_difference("ReadLater.count", 1) do
      post save_for_later_path, params: { id: @article.id }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should remove article from read later" do
    post save_for_later_path, params: { id: @article.id }

    read_later = @user.read_laters.find_by(article_id: @article.id)

    assert_difference("ReadLater.count", -1) do
      delete news_read_later_path(news_id: @article.id, id: read_later.id)
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
