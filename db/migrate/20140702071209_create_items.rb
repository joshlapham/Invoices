class CreateItems < ActiveRecord::Migration

  def up
    create_table :items do |t|
      t.string :description
      t.string :unit_cost
      t.string :quantity
      t.string :discount
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
