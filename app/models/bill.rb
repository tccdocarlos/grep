class Bill < ApplicationRecord
    belongs_to :responsible, foreign_key: 'dweller_id', class_name: 'Dweller'
    belongs_to :house
    has_many :dweller_bills, dependent: :destroy
    has_many :dwellers, through: :dweller_bills

    accepts_nested_attributes_for :dweller_bills, reject_if: :all_blank, allow_destroy: true

    def value
        DwellerBill.where(bill: self).sum(:value)
    end
end
