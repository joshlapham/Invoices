class PaymentDetail < ActiveRecord::Base
  belongs_to :user
  validates :bsb_number, :account_number, :abn_number, presence: true

  # TODO: [feature/invoice-gst-toggle] `numericality` might not be correct to use here -- how do we handle formatting/spaces in numbers? in views?
  validates :bsb_number, :account_number, :abn_number, numericality: true
end
