class AddBorrowerToLoanInquiries < ActiveRecord::Migration[5.2]
  def change
  	add_reference :loan_inquiries, :borrower, index: true
    add_foreign_key :loan_inquiries, :users, column: :borrower_id
  end
end
