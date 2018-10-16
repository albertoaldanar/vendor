class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :type
      t.datetime :time
      t.string :client
      t.references :user, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
