json.extract! loan, :id, :principal_balance, :interest_rate, :days_to_maturity, :created_at, :updated_at
json.url loan_url(loan, format: :json)
