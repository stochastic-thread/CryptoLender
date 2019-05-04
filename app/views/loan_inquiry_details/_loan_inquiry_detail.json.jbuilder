json.extract! loan_inquiry_detail, :id, :project_name, :damage_type, :organization_type, :damaged_address, :city, :state, :insured, :revenue, :estimated_loss, :headcount, :industry, :date_established, :previous_bankruptcy, :bankruptcy_count, :mailing_address, :created_at, :updated_at
json.url loan_inquiry_detail_url(loan_inquiry_detail, format: :json)
