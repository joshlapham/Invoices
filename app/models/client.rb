class Client < ActiveRecord::Base

  belongs_to :user
  has_many :invoices

  accepts_nested_attributes_for :invoices

  validates :name, presence: true

  def draft_invoices
    self.invoices.each.select { |invoice| invoice.status == 'draft' }
  end

  def sent_invoices
    self.invoices.each.select { |invoice| invoice.status == 'sent' }
  end

  def paid_invoices
    self.invoices.each.select { |invoice| invoice.status == 'paid' }
  end
  
end
