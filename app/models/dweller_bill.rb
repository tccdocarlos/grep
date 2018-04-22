class DwellerBill < ApplicationRecord
    belongs_to :dweller
    belongs_to :bill
end
