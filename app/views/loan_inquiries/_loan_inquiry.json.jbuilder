json.extract! loan_inquiry, :id, :amount, :rate, :length, :created_at, :updated_at
json.url loan_inquiry_url(loan_inquiry, format: :json)
