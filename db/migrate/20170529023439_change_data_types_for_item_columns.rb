class ChangeDataTypesForItemColumns < ActiveRecord::Migration
  def up
    change_column :items, :unit_cost, :float
    change_column :items, :quantity, :float
    change_column :items, :discount, :float
  end

  def down
    change_column :items, :unit_cost, :integer
    change_column :items, :quantity, :integer
    change_column :items, :discount, :integer
  end
end
