class Bill < ApplicationRecord
  has_many :bill_apportionments, dependent: :destroy, inverse_of: :bill
  belongs_to :bill_month
  belongs_to :bill_type

  accepts_nested_attributes_for :bill_apportionments, reject_if: :all_blank, allow_destroy: true
end
