class BillSpliting < ApplicationRecord
    belongs_to :dweller
    belongs_to :bill_type
end
