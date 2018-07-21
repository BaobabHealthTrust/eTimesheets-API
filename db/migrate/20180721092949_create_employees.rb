class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.integer :user_id, null: false
      t.string :firstname, null: false
      t.string :middlename, null: true
      t.string :lastname, null: false
      t.integer :directorate_id, null: false
      t.integer :position_id, null: false
      t.boolean :voided, default: false
      t.string :voided_reason, null: true
      t.datetime :date_voided, null: true

      t.timestamps
    end
  end
end
