class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.references :company, foreign_key: true
      t.string :name
      t.integer :vendor_amount
      t.integer :admin_amount

      t.timestamps
    end
  end
end
