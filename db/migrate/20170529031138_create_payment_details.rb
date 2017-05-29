class CreatePaymentDetails < ActiveRecord::Migration
  def up
    create_table :payment_details do |t|
      t.integer :user_id
      t.string :bsb_number
      t.string :account_number
      t.string :abn_number
      t.timestamps
    end
    add_index :payment_details, :user_id
  end

  def down
    remove_index :payment_details, :user_id
    drop_table :payment_details
  end
end
