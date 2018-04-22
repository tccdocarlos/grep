class Bill::Create
    
    def initialize(user, params)
        @user = user
        @params = params
    end
    

    def call
        @params[:dweller_id] = @user.id # who creates the bill is the responsible for it
        
        #dweller bill cant be negative
        #print @params
        Bill.create(@params)
    end
end
