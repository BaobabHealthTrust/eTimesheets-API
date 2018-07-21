class CreateDonors < ActiveRecord::Migration[5.2]
  def change
    create_table :donors do |t|
      t.string :donor, null: false
      t.text :description, null: true
      t.boolean :voided, default: false
      t.string :voided_reason, null: true
      t.datetime :date_voided, null: true

      t.timestamps
    end
  end
end
