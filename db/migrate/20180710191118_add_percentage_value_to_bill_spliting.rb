class AddPercentageValueToBillSpliting < ActiveRecord::Migration[5.2]
  def change
  	add_column :bill_splitings, :percentage_value, :float
  end
end
