class Bill < ApplicationRecord
    belongs_to :responsible, foreign_key: 'dweller_id', class_name: 'Dweller'
    belongs_to :house
    has_many :dweller_bills
    has_many :dwellers, through: :dweller_bills

    def value
        DwellerBill.where(bill: self).sum(:value)
    end
end
