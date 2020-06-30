require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "should correctly calculate total discount of an invoice based on invoice items" do
    @invoice = Invoice.new
    @invoice.save

    @invoice.items.create(description: "Test item", unit_cost: 120.0, quantity: 3.0)

    assert_equal 360.0, @invoice.calculate_subtotal, "calculate_subtotal method failed to return expected value"
    assert_equal 0, @invoice.calculate_discount, "calculate_discount method failed to return expected value"
  end

  # TODO: Move this to own `item_test.rb` file
  test "should correctly calculate total price with discount applied on Item class" do
    @item = Item.new
    @item.description = "Test item"

    # 120 x 3 = 360
    @item.unit_cost = 120.0
    @item.quantity = 3.0

    # Set discount == total price @ end should be 180.0
    @item.discount = 50.0

    assert_equal 360.0, @item.total_price, "total_price method on Item class failed to return expected value"
    assert_equal 180.0, @item.total_price_discount_applied, "total_price_discount_applied method on Item class failed to return expected value"
    assert_equal 18.0, @item.calculate_gst, "calculate_gst method on Item class failed to return expected value"
  end
end
