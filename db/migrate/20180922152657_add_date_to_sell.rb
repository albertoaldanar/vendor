class AddDateToSell < ActiveRecord::Migration[5.0]
  def change
    add_column :sells, :date, :date
    add_column :sells, :model, :string
    add_column :sells, :brand, :string
  end
end
