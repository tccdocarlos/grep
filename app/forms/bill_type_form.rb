#FIXME: Bill::Form is better for this context
class BillTypeForm

    include ActiveModel::Model
    
    attr_accessor :name, :description, :maturity, :value,
                  :dweller_id, :house_id, :bill_splitings_attributes

    validates_presence_of :name, :maturity, :value, :dweller_id, :house_id


    #validates @dweller_bills_attributes[:value], numericality: true

    # validates value_must_be_numbers

    # private
    # def value_must_be_number
    #     if @dweller_bills_attributes[:value]
    #     errors.add("value must be a number")
    # end
end