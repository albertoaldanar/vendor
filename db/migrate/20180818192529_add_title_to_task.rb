class AddTitleToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :title, :string
    add_column :tasks, :startDate, :datetime
    add_column :tasks, :endDate, :datetime
    add_column :tasks, :desc, :string
  end
end
