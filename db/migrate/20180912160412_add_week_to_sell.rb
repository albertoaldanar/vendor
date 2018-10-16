class AddWeekToSell < ActiveRecord::Migration[5.0]
  def change
    add_column :sells, :week, :integer
    add_column :sells, :finished, :boolean, default: false
  end
end
