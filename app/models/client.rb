class Client < ActiveRecord::Base

  belongs_to :user
  has_many :invoices

  accepts_nested_attributes_for :invoices

  validates :name, presence: true

  # TODO: [2020] Implement these methods; write tests first! -- see `users_controller` TODO
  # def draft_invoices
  #
  # end
  #
  # def sent_invoices
  #
  # end
  #
  # def paid_invoices
  #
  # end
  
end
