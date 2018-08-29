FactoryBot.define do
  factory :dweller, aliases: [:responsible] do
    name "carlos"
    house
    user
  end
end