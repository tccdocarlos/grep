require 'rails_helper'

RSpec.describe Dweller, type: :model do
    #FIXME: create this objects at another file
    it "should have at least one house" do
        house = House.new(name: "Vikings", description: "vida loka")
        d = Dweller.new(name: "carlos", house: house)

        expect(d.house).not_to be_nil
    end
end
