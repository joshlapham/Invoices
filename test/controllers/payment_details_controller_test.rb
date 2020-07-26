require 'test_helper'

class PaymentDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to /login if not logged-in and accessing '/new' endpoint" do
    get new_payment_detail_url
    assert_equal "new", @controller.action_name
    assert_redirected_to '/login'
    assert_equal flash[:notice], "Please log in"
  end

  test 'should show PaymentDetail if logged-in' do
    test_user = users(:testuser)
    test_password = 'password123'
    do_log_in(test_user, test_password)

    test_payment_detail = payment_details(:testpaymentdetails)

    get payment_detail_url(test_payment_detail)
    assert_response :success
    assert_equal @controller.action_name, 'show'
  end
end
