require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to /login if not logged-in and accessing '/new' endpoint" do
    get new_client_url
    assert_equal 'new', @controller.action_name
    assert_redirected_to '/login'
    assert_equal flash[:notice], 'Please log in'
  end

  test 'should show Client if logged-in' do
    test_user = users(:testuser)
    test_password = 'password123'
    do_log_in(test_user, test_password)

    test_client = clients(:testclient)

    get client_url(test_client)
    assert_response :success
    assert_equal @controller.action_name, 'show'
  end

  test 'should edit Client if logged-in' do
    test_user = users(:testuser)
    test_password = 'password123'
    do_log_in(test_user, test_password)

    test_client = clients(:testclient)

    get edit_client_url(test_client)
    assert_response :success
    assert_equal @controller.action_name, 'edit'
  end

  test "should navigate to Client '/new' endpoint if logged-in" do
    test_user = users(:testuser)
    test_password = 'password123'
    do_log_in(test_user, test_password)

    get new_client_url
    assert_response :success
    assert_equal @controller.action_name, 'new'
  end
end
