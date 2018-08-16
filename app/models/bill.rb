class Bill < ApplicationRecord
  has_many :bill_apportionments, dependent: :destroy
  belongs_to :bill_month
  belongs_to :bill_type 
end
