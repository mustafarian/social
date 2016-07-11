require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  test "user login, browse, and logout" do
    user = users(:user1)
    get login_url
    assert_response :success
    post sessions_path, email: user.email, password: "password"
    follow_redirect!
    assert_equal root_path, path
    get logout_url
    follow_redirect!
    assert_equal login_path, path
  end
end
