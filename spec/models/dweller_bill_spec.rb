require 'rails_helper'

RSpec.describe DwellerBill, type: :model do
    let(:house) { build(:house) }
    let(:dweller) { build(:dweller) }
    let(:bill) { build(:bill) }
    let(:dweller_bill) { build(:dweller_bill) }
end
