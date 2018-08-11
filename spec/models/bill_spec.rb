require 'rails_helper'

RSpec.describe Bill, type: :model do
  let(:bill) { create(:bill) }

  it { should have_many(:bill_apportionments) }

  it "creates a bill" do
    expect(bill.bill_type.name).to eq "aluguel"
  end
end
