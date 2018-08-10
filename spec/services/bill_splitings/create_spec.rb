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

    it 'creates a bill spliting with bill type id' do    	
    	  params[:dweller_id] = dweller.id
        s = BillSpliting::Create.new(bill_type, params).call()

        expect(BillSpliting.count).to eq 1
        expect(BillSpliting.last.dweller).to eq dweller
    end

    it 'creates a bill with a valid percentage value' do
        params[:dweller] = dweller
        params[:percentage_value] = 0.6

        s = BillSpliting::Create.new(bill_type, params).call()

        last_bill = BillSpliting.last

        expect(last_bill.percentage_value * last_bill.bill_type.value).to eq bill_type.value * 0.6
    end

    it 'doesnt create a bill with invalid percentage value' do
        params[:dweller] = dweller
        params[:percentage_value] = 1.2

        expect{ BillSpliting::Create.new(bill_type, params).call() }.to raise_error(BillSpliting::Create::NotValidEntryRecord)

    end
end