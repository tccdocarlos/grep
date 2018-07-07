require 'rails_helper'

RSpec.describe BillSpliting, type: :model do
    let(:house) { build(:house) }
    let(:dweller) { build(:dweller) }
    let(:bill) { build(:bill) }
    let(:bill_spliting) { build(:bill_spliting) }
end
