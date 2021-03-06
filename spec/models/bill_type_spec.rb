require 'rails_helper'

RSpec.describe BillType, type: :model do
    let(:house) { build(:house) }
    let(:dweller) { build(:dweller) }
    let(:dweller2) { build(:dweller) }
    let(:dweller3) { build(:dweller) }
    let(:bill_type) { create(:bill_type) }
    let(:bill_spliting) { create(:bill_spliting) }

    it { should have_many(:dwellers).through(:bill_splitings) }
    it { should have_many(:bills) }
    
    it "has one responsible" do
        bill_type.responsible = dweller
        expect(bill_type.responsible).to eq dweller
    end

    it 'accepts bills spliting' do
        BillType.create(name: 'light', maturity: Date.today, responsible: dweller,
                        house: house, value: 10, bill_splitings: [bill_spliting])
    end

    it "should return the right value" do
        bill_type.value = 30
        db1 = BillSpliting.create(value: 10, dweller: dweller, bill_type: bill_type)
        db2 = BillSpliting.create(value: 10, dweller: dweller, bill_type: bill_type)
        db3 = BillSpliting.create(value: 10, dweller: dweller, bill_type: bill_type)

        expect(bill_type.total_value).to eq bill_type.value
    end

    it "should have the right dwellers" do
        db1 = BillSpliting.create(value: 10, dweller: dweller, bill_type: bill_type)
        db2 = BillSpliting.create(value: 10, dweller: dweller2, bill_type: bill_type)
        db3 = BillSpliting.create(value: 10, dweller: dweller3, bill_type: bill_type)

        expect(bill_type.dwellers).to eq [ db1.dweller, db2.dweller, db3.dweller ]
    end
end
