require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "should correctly calculate subtotal of an invoice based on invoice items" do
    @invoice = Invoice.new
    @invoice.save
    @invoice.items.create(description: "Test item", unit_cost: 120.0, quantity: 3.0)

    assert_equal 360.0, @invoice.calculate_subtotal, "calculate_subtotal method failed to return expected value"
  end

  test "should correctly calculate GST amount of an invoice based on invoice items when discount applied" do
    @invoice = Invoice.new
    @invoice.save
    @invoice.items.create(description: "Test item", unit_cost: 120.0, quantity: 3.0, discount: 25.0)

    # TODO: [2020] Actual is `27` -- what should it be? subtotal would be 360, so discount amount would be 90.00
    assert_equal 90.0, @invoice.calculate_gst_amount, "calculate_gst_amount method failed to return expected value"
  end

  test "should correctly calculate GST amount of an invoice based on invoice items when no discount applied" do
    @invoice = Invoice.new
    @invoice.save
    @invoice.items.create(description: "Test item 1", unit_cost: 120.0, quantity: 3.0)
    @invoice.items.create(description: "Test item 2", unit_cost: 120.0, quantity: 3.0)

    assert_equal 72.0, @invoice.calculate_gst_amount, "calculate_gst_amount method failed to return expected value"
  end

  test "should correctly calculate total discount of an invoice based on invoice items when discount applied" do
    @invoice = Invoice.new
    @invoice.save
    @invoice.items.create(description: "Test item", unit_cost: 120.0, quantity: 3.0, discount: 25.0)

    assert_equal 90.0, @invoice.calculate_discount_amount, "calculate_discount_amount method failed to return expected value"
  end

  test "should correctly calculate total discount of an invoice based on invoice items when no discount applied" do
    @invoice = Invoice.new
    @invoice.save
    @invoice.items.create(description: "Test item", unit_cost: 120.0, quantity: 3.0)

    assert_equal 0, @invoice.calculate_discount_amount, "calculate_discount_amount method failed to return expected value"
  end
end
