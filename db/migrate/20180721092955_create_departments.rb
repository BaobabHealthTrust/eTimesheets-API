class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :department, null: false
      t.integer :directorate_id, null: false

      t.timestamps
    end
  end
end
