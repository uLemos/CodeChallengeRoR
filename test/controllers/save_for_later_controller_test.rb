require "test_helper"

class SaveForLaterControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should create readlater" do
    article = articles(:one)

    ReadLater.where(article_id: article.id, user_id: @user.id).destroy_all

    assert_difference("ReadLater.count", 1) do
      post save_for_later_path, params: { id: article.id }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
