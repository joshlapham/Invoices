require 'test_helper'

class PaymentDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to /login if not logged-in and accessing '/new' endpoint" do
    get new_payment_detail_url
    assert_redirected_to '/login'
  end
end
