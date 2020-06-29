class CreateInvoices < ActiveRecord::Migration

  def up
    create_table :invoices do |t|
      t.string :invoice_number
      t.float :amount
      t.string :date_sent
      t.string :date_due
      t.string :status
      t.integer :client_id
      t.timestamps
    end
    add_index :invoices, :client_id
  end

  def down
    remove_index :invoices, :client_id
    drop_table :invoices
  end

end
