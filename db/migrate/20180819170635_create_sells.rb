class CreateSells < ActiveRecord::Migration[5.0]
  def change
    create_table :sells do |t|
      t.integer :price
      t.string :product_type
      t.references :user, foreign_key: true
      t.boolean :authorized
      t.boolean :promotion
      t.integer :points

      t.timestamps
    end
  end
end
