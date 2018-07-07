require 'rails_helper'

RSpec.describe BillType::Create do
    let(:responsible) { create(:dweller) }
    let(:house) { create(:house) }

    params = { name: "aluguel", description: "conta que nao queriamos pagar",
               maturity: Date.today + 2, value: 25 }

    it 'should create a bill type' do
        user = responsible
        params[:house_id] = house.id

        s = BillType::Create.new(user, params).call()
        expect(BillType.count).to eq 1
        expect(s.name).to eq "aluguel"
    end

    it 'should create a bill with bill spliting' do
        user = responsible
        params[:house_id] = house.id
        s = BillType::Create.new(user, params).call()

        dweller_bills = [ { value: 10, dweller_id: user.id, bill_type_id: s.id},
                        { value: 25, dweller_id: user.id, bill_type_id: s.id} ]

        params[:bill_splitings_attributes] = dweller_bills
        params[:house_id] = house.id

        s = BillType::Create.new(user, params).call()

        # one to create the bill and the another to create with nested
        expect(BillType.count).to eq 2
        expect(BillSpliting.count).to eq 2
        expect(BillSpliting.first.bill_type).to eq s
    end
end