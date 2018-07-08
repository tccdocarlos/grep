class BillSpliting::Create
	class NotValidEntryRecord < StandardError; end

	def initialize(bill_type, params)
		@bill_type = bill_type
		@params = params
	end

	def call
		@params[:bill_type] = @bill_type
		bill_spliting_form = BillSplitingForm.new(@params)

		if bill_spliting_form.valid?
			BillSpliting.create(@params)
		else
			raise(NotValidEntryRecord, bill_spliting_form.errors.full_messages.to_sentence)
		end
	end
end