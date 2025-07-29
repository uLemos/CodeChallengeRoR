require "test_helper"

class SaveForLaterControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get save_for_later_create_url
    assert_response :success
  end
end
