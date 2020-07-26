require 'test_helper'
require 'faker'

class PaymentDetailTest < ActiveSupport::TestCase
  test "should not save without 'bsb_number'" do
    details = PaymentDetail.new
    details.account_number = Faker::Bank.unique.account_number(digits: 8)
    details.abn_number = 123456
    assert_not details.save, "Saved PaymentDetail without 'bsb_number'"
  end

  test "should not save without 'account_number'" do
    details = PaymentDetail.new
    details.bsb_number = Faker::Bank.unique.account_number(digits: 6)
    details.abn_number = 123456
    assert_not details.save, "Saved PaymentDetail without 'account_number'"
  end

  test "should not save without 'abn_number'" do
    details = PaymentDetail.new
    details.account_number = Faker::Bank.unique.account_number(digits: 8)
    details.bsb_number = Faker::Bank.unique.account_number(digits: 6)
    assert_not details.save, "Saved PaymentDetail without 'abn_number'"
  end

  test "should not save if 'bsb_number' is a string" do
    details = PaymentDetail.new
    details.bsb_number = 'this should fail'
    details.abn_number = 123456
    details.account_number = Faker::Bank.unique.account_number(digits: 8)
    assert_not details.save, "Saved PaymentDetail when 'bsb_number' was a string"
  end

  test "should correctly format 'abn_number'" do
    details = PaymentDetail.new
    details.bsb_number = Faker::Bank.unique.account_number(digits: 6)
    details.account_number = Faker::Bank.unique.account_number(digits: 8)

    # NOTE: 11 digits for AU ABN number
    # TODO: [2020] If AU ABN number, then should ensure that only 11 digits can be entered
    details.abn_number = 12345678910

    assert_instance_of String, details.abn_number_formatted, "'abn_number_formatted' returned incorrect class type"
    assert_equal details.abn_number_formatted, '12 345 678 910', "'abn_number_formatted' returned incorrect formatting"
  end

  test "should correctly format 'bsb_number'" do
    details = PaymentDetail.new

    # Note: 6 digit BSB number for AU
    # TODO: [2020] Enforce this if AU
    details.bsb_number = 123456

    # Note: 8 digit account number for AU
    # TODO: [2020] Enforce this if AU
    details.account_number = Faker::Bank.unique.account_number(digits: 8)

    # NOTE: 11 digits for AU ABN number
    details.abn_number = 12345678910

    assert_instance_of String, details.bsb_number_formatted, "'bsb_number_formatted' returned incorrect class type"
    assert_equal details.bsb_number_formatted, '123 456', "'bsb_number_formatted' returned incorrect formatting"
  end

  test "should correctly format 'account_number'" do
    details = PaymentDetail.new

    # Note: 6 digit BSB number for AU
    details.bsb_number = Faker::Bank.unique.account_number(digits: 6)

    # Note: 8 digit account number for AU
    details.account_number = 12345678

    # NOTE: 11 digits for AU ABN number
    details.abn_number = 12345678910

    assert_instance_of String, details.account_number_formatted, "'account_number_formatted' returned incorrect class type"
    assert_equal details.account_number_formatted, '12 345 678', "'account_number_formatted' returned incorrect formatting"
  end

end
