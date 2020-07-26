require 'test_helper'
require 'faker'

class UserTest < ActiveSupport::TestCase
  test "should not save a new User without 'email'" do
    @user = User.new

    assert_not @user.save, "Saved User without 'email'"
  end

  test "should not save a new User without 'password'" do
    @user = User.new
    @user.email = Faker::Internet.unique.email

    assert_not @user.save, "Saved User without 'password'"
  end

  test "should save a new User with a valid 'email' and 'password'" do
    @user = User.new
    @user.email = Faker::Internet.unique.email
    @user.password = Faker::Internet.unique.password

    assert @user.save, "Saved User with valid 'email' and 'password'"
  end
end
