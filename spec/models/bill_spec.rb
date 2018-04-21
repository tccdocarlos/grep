require 'rails_helper'

RSpec.describe Bill, type: :model do
  it "has one responsible" do
  	h = House.new(name: "Vikings", description: "vida loka")
    d = Dweller.new(name: "carlos", house: h)
  	b = Bill.new(name: 'aluguel', sporadic: false, maturity: Date.today + 2, 
  		active: true, responsible: d, house: h)

  	expect(b.responsible).to be d
  end
end
