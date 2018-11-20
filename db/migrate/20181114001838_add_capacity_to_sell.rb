class AddCapacityToSell < ActiveRecord::Migration[5.0]
  def change
    add_column :sells, :capacity, :integer
    add_column :sells, :amount, :integer
    add_column :sells, :subcategory, :string
    add_column :sells, :efficiency, :string
  end
end
