require 'rails_helper'

RSpec.describe MonthBill, type: :model do
  let(:month_bill) { build(:month_bill) }
  it "has status working" do
    expect(month_bill.status).to eq "closed"
    month_bill.opened!
    expect(month_bill.status).to eq "opened"
  end
end
