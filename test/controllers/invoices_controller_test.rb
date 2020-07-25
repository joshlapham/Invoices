require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to /login if not logged-in and accessing '/new' endpoint" do
    get new_invoice_url
    assert_redirected_to '/login'
  end
end
