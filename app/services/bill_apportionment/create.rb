class BillApportionment::Create
  class NotValidEntryRecord < StandardError; end

  def initialize(bill, params)
    @bill = bill
    @params = params
  end

  def call
    @params[:bill] = @bill

    # TODO: remake this
    if(@params.key?(:dweller_id))
      @params[:dweller] = Dweller.find(@params[:dweller_id])
      @params.delete(:dweller_id)
    end
  
    bill_spliting_form = BillApportionmentForm.new(@params)

    if bill_spliting_form.valid?
      BillApportionment.create(@params)
    else
      raise(NotValidEntryRecord, bill_spliting_form.errors.full_messages.to_sentence)
    end
  end
end