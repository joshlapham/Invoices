require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to /login if not logged-in and accessing '/logout' endpoint" do
    get logout_url
    assert_redirected_to '/login'
  end
end
