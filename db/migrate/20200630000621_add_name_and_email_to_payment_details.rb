class AddNameAndEmailToPaymentDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_details, :name_for_invoice, :string
    add_column :payment_details, :email_for_invoice, :string
  end
end
