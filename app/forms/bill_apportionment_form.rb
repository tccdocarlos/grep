class BillApportionmentForm

  include ActiveModel::Model

  attr_accessor :value, :dweller, :bill

  validates_presence_of :value, :dweller, :bill
end