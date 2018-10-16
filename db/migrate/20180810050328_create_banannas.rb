class CreateBanannas < ActiveRecord::Migration[5.0]
  def change
    create_table :banannas do |t|
      t.string :color
      t.string :price

      t.timestamps
    end
  end
end
