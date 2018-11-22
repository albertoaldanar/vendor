class CreateVariables < ActiveRecord::Migration[5.0]
  def change
    create_table :variables do |t|
      t.integer :week
      t.string :month

      t.timestamps
    end
  end
end
