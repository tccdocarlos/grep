class BillSpliting::Create
	class NotValidEntryRecord < StandardError; end

	def initialize(bill_type, params)
		@bill_type = bill_type
		@params = params
	end

	def call
		@params[:bill_type] = @bill_type

		# TODO: remake this
		if(@params.key?(:dweller_id))
			@params[:dweller] = Dweller.find(@params[:dweller_id])
			@params.delete(:dweller_id)
		end
	
		bill_spliting_form = BillSplitingForm.new(@params)

		if bill_spliting_form.valid?
			BillSpliting.create(@params)
		else
			raise(NotValidEntryRecord, bill_spliting_form.errors.full_messages.to_sentence)
		end
	end
end