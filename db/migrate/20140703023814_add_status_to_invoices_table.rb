class AddStatusToInvoicesTable < ActiveRecord::Migration

  def up
    add_column :invoices, :status, :string
  end

  def down
    remove_column :invoices, :status
  end

end
