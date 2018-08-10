require 'rails_helper'

RSpec.describe BillMonth, type: :model do
  let(:bill_month) { build(:bill_month) }
  it "has status working" do
    expect(bill_month.status).to eq "closed"
    bill_month.opened!
    expect(bill_month.status).to eq "opened"
  end
end
