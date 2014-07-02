class CreateUsers < ActiveRecord::Migration

  def up
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :is_admin
      t.timestamps
    end
  end

  def down
    drop_table :users
  end

end
