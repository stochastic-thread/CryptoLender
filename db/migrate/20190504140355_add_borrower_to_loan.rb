class AddBorrowerToLoan < ActiveRecord::Migration[5.2]
  def change
    add_reference :loans, :borrower, index: true
    add_foreign_key :loans, :users, column: :borrower_id
  end
end
