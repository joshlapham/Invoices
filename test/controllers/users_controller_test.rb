require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect to /login if not logged-in and accessing root URL' do
    get root_url
    assert_redirected_to '/login'
    follow_redirect!
    assert_select 'h4', 'Login'
  end

  test 'should redirect to main page on successful login' do
    test_user = users(:testuser)
    password = 'password123'
    post '/attempt_login', params: { email: test_user.email, password: password }
    assert_equal @controller.action_name, 'attempt_login'
    assert_equal session[:user_id], test_user.id
    assert_equal session[:email], test_user.email
    assert_equal flash[:notice], 'You are now logged in'
    assert_redirected_to '/'
  end

  test 'should redirect to login page on successful logout' do
    # Do login
    test_user = users(:testuser)
    password = 'password123'
    post '/attempt_login', params: { email: test_user.email, password: password }
    assert_equal @controller.action_name, 'attempt_login'
    assert_equal session[:user_id], test_user.id
    assert_equal session[:email], test_user.email
    assert_equal flash[:notice], 'You are now logged in'
    assert_redirected_to '/'

    #  Do logout
    get logout_url
    assert_equal @controller.action_name, 'logout'
    assert_nil session[:user_id]
    assert_nil session[:email]
    assert_equal flash[:notice], 'Logged out'
    assert_redirected_to '/login'
  end

  test 'should redirect to login page on unsuccessful login' do
    test_user = users(:testuser)
    password = 'incorrectpassword123'
    post '/attempt_login', params: { email: test_user.email, password: password }
    assert_equal @controller.action_name, 'attempt_login'
    assert_nil session[:user_id]
    assert_nil session[:email]
    assert_equal flash[:notice], 'Invalid username or password'
    assert_redirected_to '/login'
  end
end
