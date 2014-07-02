class CreateClients < ActiveRecord::Migration

  def up
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :company
      t.integer :user_id
      t.timestamps
    end
    add_index :clients, :user_id
  end

  def down
    remove_index :clients, :user_id
    drop_table :clients
  end

end
