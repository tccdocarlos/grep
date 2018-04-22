#FIXME: Bill::Form is better for this context
class BillForm

    include ActiveModel::Model
    
    attr_accessor :name, :description, :sporadic, :maturity, :active,
                  :dweller_id, :house_id, :dweller_bills_attributes

    validates_presence_of :name, :maturity, :active, :dweller_id, :house_id

    validates :sporadic, inclusion: { in: [true, false] }

    #validates @dweller_bills_attributes[:value], numericality: true

    # validates value_must_be_number

    # private
    # def value_must_be_number
    #     if @dweller_bills_attributes[:value]
    #     errors.add("value must be a number")
    # end
end