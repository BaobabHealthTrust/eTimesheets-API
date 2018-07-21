class CreateUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_roles do |t|
      t.integer :role_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
