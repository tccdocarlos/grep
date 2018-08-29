require 'rails_helper'

RSpec.describe User, type: :model do
  let(:house) { create(:house) }
  it 'creates a user' do
    dweller = Dweller.create(name: 'caca', house: house)
 
    User.create(email: 'example@example.com', password: '123456', 
                password_confirmation: '123456', dweller: dweller)
 
    expect(User.count).to eq 1
  end
end
