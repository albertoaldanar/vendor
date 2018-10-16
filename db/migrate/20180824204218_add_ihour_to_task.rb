class AddIhourToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :ihour, :string
    add_column :tasks, :ehour, :string
    add_column :tasks, :idate, :string
    add_column :tasks, :type, :string
  end
end
