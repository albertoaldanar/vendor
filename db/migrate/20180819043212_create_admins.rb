class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.references :team, foreign_key: true
      t.string :name
      t.string :photo
      t.string :username
      t.string :email

      t.timestamps
    end
  end
end
