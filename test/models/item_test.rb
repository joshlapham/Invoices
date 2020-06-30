require 'test_helper'

class ItemTest < ActiveSupport::TestCase
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

  test "should correctly calculate total price with no discount applied on Item class" do
    @item = Item.new
    @item.description = "Test item"

    # 120 x 3 = 360
    @item.unit_cost = 120.0
    @item.quantity = 3.0

    assert_equal 360.0, @item.total_price, "total_price method on Item class failed to return expected value"
    assert_equal 360.0, @item.total_price_discount_applied, "total_price_discount_applied method on Item class failed to return expected value"
    assert_equal 36.0, @item.calculate_gst, "calculate_gst method on Item class failed to return expected value"
  end
end
