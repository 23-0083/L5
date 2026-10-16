require "test_helper"

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get top_main_url
    assert_response :success
  end

  test "should get login_form" do
    get top_login_form_url
    assert_response :success
  end
end
