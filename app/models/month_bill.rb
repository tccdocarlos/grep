class MonthBill < ApplicationRecord
  enum status: [:opened, :closed]
  belongs_to :house
end
