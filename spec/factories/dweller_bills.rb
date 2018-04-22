FactoryBot.define do
  factory :dweller_bill do
    value 10
    paid false
    dweller
    bill
  end
end