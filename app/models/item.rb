class Item < ActiveRecord::Base

  belongs_to :invoice

  # Method to calculate total price of item after discount
  def total_price
    (self.unit_cost.to_i * self.quantity.to_i) * ((100 - self.discount.to_i) / 100.0)
  rescue NoMethodError => method
    0
  end

  # Calculate invoice total with GST applied (10%)
  # TODO: update naming for clarity
  def calculate_gst
    (self.unit_cost.to_i * self.quantity.to_i) * 0.10
  rescue NoMethodError => method
    0
  end

end
