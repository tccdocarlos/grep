json.extract! bill, :id, :paid_value, :month_value, :paid_date, :maturity_date, :bill_month_id, :bill_type_id, :created_at, :updated_at
json.url bill_url(bill, format: :json)
