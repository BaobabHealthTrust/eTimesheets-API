class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.string :position, null: false
      t.string :description, null: true
      t.boolean :voided, default: false
      t.string :voided_reason, null: true
      t.datetime :date_voided, null: true

      t.timestamps
    end
  end
end
