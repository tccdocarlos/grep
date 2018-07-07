class BillType::Create
    class NotValidEntryRecord < StandardError; end
    
    def initialize(user, params)
        @user = user
        @params = params
    end
    

    def call
        # who creates the bill is the responsible for it
        @params[:dweller_id] = @user.id
        @params[:maturity] = Date.today - 2
        bill_type_form = BillTypeForm.new(@params)

        
        if bill_type_form.valid?
            BillType.create(@params)
        else
            raise(NotValidEntryRecord, bill_type_form.errors.full_messages.to_sentence)
        end
    end
end
