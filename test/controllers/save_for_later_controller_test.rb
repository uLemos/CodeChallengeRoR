require "test_helper"

class SaveForLaterControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should create readlater" do
    assert_difference("ReadLater.count", 1) do
      post save_for_later_create_url, params: { article_id: article_id }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
