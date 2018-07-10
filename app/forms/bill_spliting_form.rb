class BillSplitingForm
	
	include ActiveModel::Model

	attr_accessor :value, :dweller, :bill_type, :percentage_value

	validates_presence_of :value, :dweller, :bill_type

	validates :percentage_value, inclusion: 0..1, allow_nil: true
end