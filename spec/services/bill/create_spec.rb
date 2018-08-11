require 'rails_helper'

RSpec.describe Bill::Create do
  let(:bill_type) { create(:bill_type) }
  let(:bill_month) { create(:bill_month) }
  let(:params) { {paid_value: 5, month_value: 6, paid_date: Date.today, 
               maturity_date: Date.today, bill_month_id: bill_month.id, bill_type_id: bill_type.id} }
  
	
  it "creates a bill using bill service" do
    s = Bill::Create.new(params).call

    expect(Bill.count).to eq 1
  end
end