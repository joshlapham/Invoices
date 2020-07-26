require 'test_helper'
require 'faker'

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

  test 'should successfully create a new Client if logged-in' do
    test_user = users(:testuser)
    test_password = 'password123'
    do_log_in(test_user, test_password)

    test_name = Faker::Name.unique.name
    test_company = Faker::Company.unique.name
    test_email = Faker::Internet.unique.email
    test_phone = Faker::PhoneNumber.unique.cell_phone_in_e164
    test_address = Faker::Address.unique.full_address

    assert_difference('Client.count') do
      post clients_url, params:
          {
            client: { name: test_name, company: test_company, email: test_email, phone: test_phone, address: test_address }
          }
    end

    assert_redirected_to client_path(Client.last)

    follow_redirect!

    assert_equal flash[:notice], 'Client saved successfully'

    # Ensure `Client` object properties match test data values
    assert_equal Client.last.name, test_name
    assert_equal Client.last.email, test_email
    assert_equal Client.last.company, test_company
    assert_equal Client.last.phone, test_phone
    assert_equal Client.last.address, test_address
  end

  test 'should successfully update a Client if logged-in' do
    flunk

    assert_redirected_to client_path(Client.last)
    follow_redirect!
    assert_equal flash[:notice], 'Client updated successfully'
  end

  test 'should successfully delete a Client if logged-in' do
    flunk

    test_client = clients(:testclient)

    assert_redirected_to root_url
    follow_redirect!
    assert_equal flash[:notice], "Client '#{test_client.name}' deleted"
  end
end
