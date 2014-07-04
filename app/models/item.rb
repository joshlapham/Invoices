class Item < ActiveRecord::Base

  belongs_to :invoice

  def total_price
    self.unit_cost * self.quantity * ((100 - self.discount) / 100.0)
  rescue NoMethodError => method
    0
  end
  
end
