class Client < ActiveRecord::Base

  belongs_to :user
  has_many :invoices

  accepts_nested_attributes_for :invoices
  
end
