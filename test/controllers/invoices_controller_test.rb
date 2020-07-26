require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to /login if not logged-in and accessing '/new' endpoint" do
    get new_invoice_url
    assert_equal "new", @controller.action_name
    assert_redirected_to '/login'
    assert_equal flash[:notice], "Please log in"
  end

  test 'should show Invoice if logged-in' do
    test_user = users(:testuser)
    test_password = 'password123'
    do_log_in(test_user, test_password)

    test_invoice = invoices(:testinvoice_draft)

    get invoice_url(test_invoice)
    assert_response :success
    assert_equal @controller.action_name, 'show'
  end
end
