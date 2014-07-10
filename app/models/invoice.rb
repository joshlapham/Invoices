class Invoice < ActiveRecord::Base

  before_save :calculate_total

  belongs_to :client
  has_many :items, :dependent => :destroy

  accepts_nested_attributes_for :items, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true

  private

  # Method to calculate total of invoice items
  def calculate_total
    self.amount = 0

    self.items.each do |item|
      unless item.marked_for_destruction?
        self.amount += (item.quantity.to_i * item.unit_cost.to_i) * ((100 - item.discount.to_i) / 100.0)
      end
    end

  end

end
