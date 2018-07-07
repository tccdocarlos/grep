class CreateDwellers < ActiveRecord::Migration[5.2]
  def change
    create_table :dwellers do |t|
      t.string :name
      t.references :house

      t.timestamps
    end
  end
end
