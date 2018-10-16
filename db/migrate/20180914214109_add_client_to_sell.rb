class AddClientToSell < ActiveRecord::Migration[5.0]
  def change
    add_column :sells, :client, :string
  end
end
