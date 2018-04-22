require 'rails_helper'

RSpec.describe Bill::Create do
    let(:responsible) { create(:dweller) }
    let(:house) { create(:house) }

    params = { name: "aluguel", description: "conta que nao queriamos pagar",
                 sporadic: false, maturity: Date.today + 2, active: true }

    it 'should create a bill' do
        user = responsible
        params[:house_id] = house.id

        s = Bill::Create.new(user, params).call()
        expect(Bill.count).to eq 1
        expect(s.name).to eq "aluguel"
    end

    it 'should create a bill with dweller bills' do
        user = responsible
        params[:house_id] = house.id
        s = Bill::Create.new(user, params).call()

        dweller_bills = [ { value: 10, paid: false, dweller_id: user.id, bill_id: s.id},
                        { value: 25, paid: false, dweller_id: user.id, bill_id: s.id} ]

        params[:dweller_bills_attributes] = dweller_bills
        params[:house_id] = house.id

        s = Bill::Create.new(user, params).call()

        # one to create the bill and the another to create with nested
        expect(Bill.count).to eq 2
        expect(DwellerBill.count).to eq 2
        expect(DwellerBill.first.bill).to eq s
    end
end