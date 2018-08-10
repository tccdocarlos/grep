class BillForm
  
  include ActiveModel::Model

  attr_accessor :paid_value, :month_value, :paid_date, :maturity_date, 
                :bill_month, :bill_type

  validates_presence_of :bill_type, :bill_month, :paid_value
end