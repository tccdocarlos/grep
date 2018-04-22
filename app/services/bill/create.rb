class Bill::Create
    class NotValidEntryRecord < StandardError; end
    
    def initialize(user, params)
        @user = user
        @params = params
    end
    

    def call
        # who creates the bill is the responsible for it
        @params[:dweller_id] = @user.id
        bill_form = BillForm.new(@params)
        
        if bill_form.valid?
            Bill.create(@params)
        else
            raise(NotValidEntryRecord, bill_form.errors.full_messages.to_sentence)
        end
    end
end
