class BillForm
  
  include ActiveModel::Model

  attr_accessor :paid_value, :month_value, :paid_date, :maturity_date, 
                :bill_month_id, :bill_type_id

  #to format dates
  #attr_accessor "maturity_date(1i)", "maturity_date(2i)", "maturity_date(3i)", "maturity_date(4i)", "maturity_date(5i)",
  #              "paid_date(1i)", "paid_date(2i)", "paid_date(3i)", "paid_date(4i)", "paid_date(5i)"

  validates_presence_of :bill_type_id, :bill_month_id, :paid_value
end