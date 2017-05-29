class ChangeDataTypeForInvoiceAmountColumn < ActiveRecord::Migration
  def up
    change_column :invoices, :amount, :float
  end

  def down
    change_column :invoices, :amount, :integer
  end
end
