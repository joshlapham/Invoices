require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "Test fixture data" do
    client = clients(:testclient)
    assert_equal client.user.email, "test@user.com"
    assert_equal client.name, "Test Client"
  end

  test "should not save a new Client without 'name'" do
    @client = Client.new

    assert_not @client.save, "Saved Client without 'name'"
  end
end
