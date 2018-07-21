class CreateRolesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :roles_users do |t|
      t.integer :role_id, null: false
      t.integer :user_id, null: false
    end
  end
end
