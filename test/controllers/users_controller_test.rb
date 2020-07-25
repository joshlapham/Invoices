require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to /login if not logged-in and accessing root URL" do
    get root_url
    assert_redirected_to '/login'
  end
end
