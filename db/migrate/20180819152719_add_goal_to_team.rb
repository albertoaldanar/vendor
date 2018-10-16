class AddGoalToTeam < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :goal, :integer
    add_column :teams, :actualSell, :integer
  end
end
