class CreateBillApportionments < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_apportionments do |t|
      t.references :bill, foreign_key: true
      t.decimal :value
      t.references :dweller, foreign_key: true

      t.timestamps
    end
  end
end
