class AddTeamToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :team, foreign_key: true
    add_column :users, :sells, :integer
    add_column :users, :points, :integer
  end
end
