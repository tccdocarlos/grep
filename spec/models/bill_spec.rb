require 'rails_helper'

RSpec.describe Bill, type: :model do
    let(:house) { build(:house) }
    let(:dweller) { build(:dweller) }
    let(:dweller2) { build(:dweller) }
    let(:dweller3) { build(:dweller) }
    let(:bill) { create(:bill) }

    it { should have_many(:dwellers).through(:dweller_bills) }
    
    it "has one responsible" do
        bill.responsible = dweller
        expect(bill.responsible).to eq dweller
    end

    it "should return the right value" do
        db1 = DwellerBill.create(value: 10, paid: false, dweller: dweller, bill: bill)
        db2 = DwellerBill.create(value: 10, paid: false, dweller: dweller, bill: bill)
        db3 = DwellerBill.create(value: 10, paid: false, dweller: dweller, bill: bill)

        expect(bill.value).to eq 30
    end

    it "should have the right dwellers" do
        db1 = DwellerBill.create(value: 10, paid: false, dweller: dweller, bill: bill)
        db2 = DwellerBill.create(value: 10, paid: false, dweller: dweller2, bill: bill)
        db3 = DwellerBill.create(value: 10, paid: false, dweller: dweller3, bill: bill)

        expect(bill.dwellers).to eq [ db1.dweller, db2.dweller, db3.dweller ]
    end
end
