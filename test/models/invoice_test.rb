require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "should correctly calculate total discount of an invoice based on invoice items" do
    @invoice = Invoice.new
    @invoice.save

    @invoice.items.create(description: "Test item", unit_cost: 120.0, quantity: 3.0)

    # TODO: [2020] This is failing -- actual is `396.0`, so GST is being applied
    assert_equal 360.0, @invoice.calculate_subtotal, "calculate_subtotal method failed to return expected value"

    # TODO: [2020] This is a private method, so this fails
    # assert_equal 396.0, @invoice.calculate_total, "calculate_total method failed to return expected value"

    # TODO: [2020] This fails -- actual is `396.0` -- makes no sense
    assert_equal 0, @invoice.calculate_discount, "calculate_discount method failed to return expected value"
  end
end
