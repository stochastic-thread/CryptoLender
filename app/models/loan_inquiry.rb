class LoanInquiry < ApplicationRecord
  belongs_to :borrower, class_name: "User"
end
