require 'rails_helper'

RSpec.describe Dweller, type: :model do
    let(:house) { build(:house) }
    let(:dweller) { build(:dweller) }

    it { should have_many(:bills).through(:dweller_bills) }
    
    it "should have at least one house" do
    	dweller.house = house

        expect(dweller.house).not_to be_nil
    end
end
