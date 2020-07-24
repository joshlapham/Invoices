require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "should not save a new Client without 'name'" do
    @client = Client.new

    assert_not @client.save, "Saved Client without 'name'"
  end
end
