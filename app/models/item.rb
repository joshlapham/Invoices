class Item < ActiveRecord::Base

  belongs_to :invoice

  # Method to calculate total price of item after discount
  def total_price
    (self.unit_cost.to_i * self.quantity.to_i) * ((100 - self.discount.to_i) / 100.0)
  rescue NoMethodError => method
    0
  end
  
end
