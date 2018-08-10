class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.decimal :paid_value
      t.decimal :month_value
      t.datetime :paid_date
      t.datetime :maturity_date
      t.references :bill_month, foreign_key: true
      t.references :bill_type, foreign_key: true

      t.timestamps
    end
  end
end
