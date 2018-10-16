class CreateTaskAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :task_admins do |t|
      t.references :admin, foreign_key: true
      t.string :title
      t.string :description
      t.datetime :time

      t.timestamps
    end
  end
end
