class Invoice < ActiveRecord::Base

  before_save :calculate_total

  belongs_to :client
  has_many :items, :dependent => :destroy

  accepts_nested_attributes_for :items, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true

  def calculate_subtotal(should_calculate_gst = false)
    subtotal = 0

    self.items.each do |item|
      unless item.marked_for_destruction?

        # TODO: [2020] Looks like `0.10` is hardcoded GST value here maybe? shouldn't do that
        if should_calculate_gst == true
          subtotal += (item.quantity.to_f * item.unit_cost.to_f) + ((item.quantity.to_f * item.unit_cost.to_f) * 0.10)
        else
          subtotal += (item.quantity.to_f * item.unit_cost.to_f)
        end

      end
    end

    return subtotal
  end

  def calculate_gst_amount
    total = 0

    self.items.each do |item|
      unless item.marked_for_destruction?
        total += item.calculate_gst
      end
    end

    return total
  end

  def calculate_discount
    # TODO: [2020] This method must be flawed -- returns a discount amount even if no discount was applied to invoice items -- WRITE A TEST!
    discount = 0

    self.items.each do |item|
      unless item.marked_for_destruction?

        # TODO: [2020] This looks bad
        discount += self.calculate_subtotal - self.amount

      end
    end

    return discount
  end

  private

  # Calculate invoice total with discount and GST applied (10%)
  # TODO: update naming for clarity
  # TODO: [2020] When is this called? Why is it private?
  def calculate_total
    self.amount = 0

    self.items.each do |item|
      unless item.marked_for_destruction?
        self.amount += (item.quantity.to_f * item.unit_cost.to_f) * ((100 - item.discount.to_f) / 100.0) + ((item.quantity.to_f * item.unit_cost.to_f) * 0.10)
      end
    end
  end

end
