class Bill::Create
  class NotValidEntryRecord < StandardError; end

  def initialize(params)
    @params = params
  end

  def call
    bill_form = BillForm.new(@params)

    if(bill_form.valid?)
      Bill.create(@params)
    else
      raise(NotValidEntryRecord, bill_form.errors.full_messages.to_sentence)
    end
  end
end