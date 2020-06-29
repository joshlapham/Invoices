require 'test_helper'

class PaymentDetailTest < ActiveSupport::TestCase
  test "should not save without 'bsb_number'" do
    details = PaymentDetail.new
    assert_not details.save, "Saved PaymentDetail without 'bsb_number'"
  end
end
