class Invoice < ActiveRecord::Base

  before_save :calculate_total

  belongs_to :client
  has_many :items, :dependent => :destroy

  accepts_nested_attributes_for :items, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true

  private

  # Calculate invoice total with discount and GST applied (10%)
  # TODO: update naming for clarity
  def calculate_total
    self.amount = 0

    self.items.each do |item|
      unless item.marked_for_destruction?
        self.amount += (item.quantity.to_f * item.unit_cost.to_f) * ((100 - item.discount.to_f) / 100.0) + ((item.quantity.to_f * item.unit_cost.to_f) * 0.10)
      end
    end
  end

end
