FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "email_#{n}@example.com"}
    password "123456"
    password_confirmation "123456"
  end
end
