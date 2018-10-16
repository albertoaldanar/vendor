class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :logo
      t.string :location
      t.string :industry
      t.integer :team_amount

      t.timestamps
    end
  end
end
