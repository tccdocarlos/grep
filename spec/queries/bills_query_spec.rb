require 'rails_helper'

RSpec.describe BillsQuery do
  let(:bill) { create(:bill) }
  let(:bill_apportionemnt) { create(:bill_apportionemnt) }
  let(:dweller) { create(:dweller) }


  it "should return a bill apportionment" do
    b = BillsQuery.new(dweller)
    expect(b.all).not_to eq nil
  end
end
