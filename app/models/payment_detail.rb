class PaymentDetail < ActiveRecord::Base
  belongs_to :user
  validates :bsb_number, :account_number, :abn_number, presence: true
  validates :bsb_number, :account_number, :abn_number, numericality: true

  def abn_number_formatted
    # Returns a correctly formatted AU ABN as a String
    ActiveSupport::NumberHelper::number_to_delimited(self.abn_number, delimiter: " ")
  end

  def bsb_number_formatted
    # Returns a correctly formatted AU BSB as a String
    ActiveSupport::NumberHelper::number_to_delimited(self.bsb_number, delimiter: " ")
  end

  def account_number_formatted
    # Returns a correctly formatted AU Account Number as a String
    ActiveSupport::NumberHelper::number_to_delimited(self.account_number, delimiter: " ")
  end
end
