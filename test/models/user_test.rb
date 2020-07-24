require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save a new User without 'email'" do
    @user = User.new

    assert_not @user.save, "Saved User without 'email'"
  end

  test "should not save a new User without 'password'" do
    @user = User.new
    @user.email = "test@user.com"

    assert_not @user.save, "Saved User without 'password'"
  end

  test "should not save a new User without 'password_confirmation'" do
    @user = User.new
    @user.email = "test@user.com"
    @user.password = "123456"

    assert_not @user.save, "Saved User without 'password_confirmation'"
  end

  test "should save a new User with a valid 'email' and 'password'" do
    @user = User.new
    @user.email = "test@user.com"
    @user.password = "123456"
    @user.password_confirmation = "123456"

    assert @user.save, "Saved User with valid 'email' and 'password'"
  end
end
