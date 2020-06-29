require 'test_helper'

class PaymentDetailTest < ActiveSupport::TestCase
  test "should not save without 'bsb_number'" do
    details = PaymentDetail.new
    assert_not details.save, "Saved PaymentDetail without 'bsb_number'"
  end

  test "should not save without 'account_number'" do
    details = PaymentDetail.new
    assert_not details.save, "Saved PaymentDetail without 'account_number'"
  end

  test "should not save without 'abn_number'" do
    details = PaymentDetail.new
    assert_not details.save, "Saved PaymentDetail without 'abn_number'"
  end

  test "should not save if 'bsb_number' is a string" do
    details = PaymentDetail.new
    details.bsb_number = "this should fail"
    assert_not details.save, "Saved PaymentDetail when 'bsb_number' was a string"
  end
end
