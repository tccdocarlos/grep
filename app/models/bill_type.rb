class BillType < ApplicationRecord
  belongs_to :responsible, foreign_key: 'dweller_id', class_name: 'Dweller'
  belongs_to :house
  has_many :bill_splitings, dependent: :destroy
  has_many :dwellers, through: :bill_splitings
  has_many :bills, dependent: :destroy

  accepts_nested_attributes_for :bill_splitings, reject_if: :all_blank, allow_destroy: true

  def total_value
      BillSpliting.where(bill_type: self).sum(:value)
  end
end
