require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "should correctly calculate total discount of an invoice based on invoice items" do
    @invoice = Invoice.new
    @invoice.save

    @invoice.items.create(description: "Test item", unit_cost: 120.0, quantity: 3.0)

    assert_equal 360.0, @invoice.calculate_subtotal, "calculate_subtotal method failed to return expected value"
    assert_equal 0, @invoice.calculate_discount, "calculate_discount method failed to return expected value"
  end
end
