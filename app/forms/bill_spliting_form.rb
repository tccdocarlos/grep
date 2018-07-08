class BillSplitingForm
	
	include ActiveModel::Model

	attr_accessor :value, :dweller, :bill_type

	validates_presence_of :value, :dweller, :bill_type
end