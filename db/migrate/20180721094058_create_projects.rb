class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :project, null: false
      t.integer :donor_id, null: false
      t.text :description, null: true
      t.boolean :voided, default: false
      t.string :voided_reason, null: true
      t.datetime :date_voided, null: true

      t.timestamps
    end
  end
end
