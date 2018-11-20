class AddMonthToSell < ActiveRecord::Migration[5.0]
  def change
    add_column :sells, :month, :string
  end
end
