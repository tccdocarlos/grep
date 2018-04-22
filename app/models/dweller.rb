class Dweller < ApplicationRecord
	belongs_to :house
    has_many :dweller_bills
	has_many :bills, through: :dweller_bills
end
