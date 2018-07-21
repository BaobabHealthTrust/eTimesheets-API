class CreateDirectorates < ActiveRecord::Migration[5.2]
  def change
    create_table :directorates do |t|
      t.string :name, null: false
      t.boolean :voided, default: false
      t.string :voided_reason, null: true
      t.datetime :date_voided, null: true

      t.timestamps
    end
  end
end
