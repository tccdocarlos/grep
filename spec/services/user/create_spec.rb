require 'rails_helper'

RSpec.describe User::Create do
  params = { email: 'test@test.com', password: '123456', password_confirmation: '123456' }
  it 'should create a dweller after create a user' do
    s = User::Create.new(params).call

    expect(Dweller.count).to eq 1
  end
end