require 'rails_helper'
# db1 = BillSpliting.create(value: 10, dweller: dweller, bill_type: bill_type) 
RSpec.describe BillSpliting::Create do
    let(:bill_type) { create(:bill_type) }
    let(:dweller) { create(:dweller) }

    params = { value: 10 }
    it 'creates a bill spliting' do
        params[:dweller] = dweller
        s = BillSpliting::Create.new(bill_type, params).call()

        expect(BillSpliting.count).to eq 1
    end
end