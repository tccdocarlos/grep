class CreateDwellerBills < ActiveRecord::Migration[5.2]
  def change
    create_table :dweller_bills do |t|
      t.decimal :value
      t.boolean :paid
      t.references :dweller, foreign_key: true
      t.references :bill, foreign_key: true

      t.timestamps
    end
  end
end
