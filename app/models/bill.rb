class Bill < ApplicationRecord
  belongs_to :responsible, foreign_key: 'dweller_id', class_name: 'Dweller'
  belongs_to :house
end
