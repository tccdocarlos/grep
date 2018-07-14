class CreateMonthBills < ActiveRecord::Migration[5.2]
  def change
    create_table :month_bills do |t|
      t.date :month
      t.integer :status
      t.references :house, foreign_key: true

      t.timestamps
    end
  end
end
