class BillApportionment < ApplicationRecord
  belongs_to :bill
  belongs_to :dweller
end
