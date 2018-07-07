class CreateBillSplitings < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_splitings do |t|
      t.decimal :value
      t.references :dweller, foreign_key: true
      t.references :bill_type, foreign_key: true
      
      t.timestamps
    end
  end
end
