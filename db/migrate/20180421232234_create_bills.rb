class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :sporadic, null: false
      t.date :maturity, null: false
      t.boolean :active
      t.references :dweller, foreign_key: true
      t.references :house, foreign_key: true

      t.timestamps
    end
  end
end
