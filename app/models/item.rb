class Item < ActiveRecord::Base

  belongs_to :invoice

  # Method to calculate total price of item after discount
  def total_price
    (self.unit_cost.to_f * self.quantity.to_f)
  rescue NoMethodError => method
    0
  end

  def total_price_discount_applied
    (self.unit_cost.to_f * self.quantity.to_f) * ((100 - self.discount.to_f) / 100.0)
  rescue NoMethodError => method
    0
  end

  # Calculate invoice total with GST applied (10%)
  # TODO: update naming for clarity
  def calculate_gst
    (self.unit_cost.to_f * self.quantity.to_f) * 0.10
  rescue NoMethodError => method
    0
  end

end
