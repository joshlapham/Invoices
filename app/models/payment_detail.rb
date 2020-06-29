class PaymentDetail < ActiveRecord::Base
  belongs_to :user
  validates :bsb_number, :account_number, :abn_number, presence: true
end
