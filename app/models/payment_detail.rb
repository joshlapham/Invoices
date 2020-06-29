class PaymentDetail < ActiveRecord::Base
  belongs_to :user
  validates :bsb_number, :account_number, :abn_number, presence: true
  validates :bsb_number, :account_number, :abn_number, numericality: true
end
