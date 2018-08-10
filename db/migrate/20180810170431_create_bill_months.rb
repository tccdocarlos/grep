class CreateBillMonths < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_months do |t|
      t.date :month
      t.integer :status
      t.references :house, foreign_key: true

      t.timestamps
    end
  end
end
