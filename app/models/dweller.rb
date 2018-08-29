class Dweller < ApplicationRecord
	belongs_to :house, optional: true
	has_one :user
  has_many :bill_splitings, dependent: :destroy
	has_many :bill_types, through: :bill_splitings
end
