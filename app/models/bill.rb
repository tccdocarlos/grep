class Bill < ApplicationRecord
  belongs_to :bill_month
  belongs_to :bill_type

  
end
