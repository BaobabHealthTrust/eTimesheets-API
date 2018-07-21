class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :timesheet_id, null: false
      t.integer :project_id, null: false
      t.datetime :start_time, null: false
      t.datetime :endtime, null: false
      t.text :description, null: false
      t.boolean :voided, default: false
      t.string :voided_reason, null: true
      t.datetime :date_voided, null: true

      t.timestamps
    end
  end
end
