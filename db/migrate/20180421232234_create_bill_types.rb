class CreateBillTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_types do |t|
	    t.string :name, null: false
      t.text :description
      t.date :maturity, null: false
      t.decimal :value
      t.references :dweller, foreign_key: true
      t.references :house, foreign_key: true
      
      t.timestamps
    end
  end
end
