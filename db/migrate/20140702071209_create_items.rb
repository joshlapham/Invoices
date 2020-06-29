class CreateItems < ActiveRecord::Migration

  def up
    create_table :items do |t|
      t.string :description
      t.float :unit_cost
      t.float :quantity
      t.float :discount, default: 0.0
      t.integer :invoice_id
      t.timestamps
    end
    add_index :items, :invoice_id
  end

  def down
    remove_index :items, :invoice_id
    drop_table :items
  end
  
end
