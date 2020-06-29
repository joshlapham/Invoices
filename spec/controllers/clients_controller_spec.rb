require 'rails_helper'

RSpec.describe ClientsController, :type => :controller do

end

class ClientsTest < ActiveSupport::TestCase
  test "should successfully create new client" do
    client = Client.new
    assert_not client.save
  end
end