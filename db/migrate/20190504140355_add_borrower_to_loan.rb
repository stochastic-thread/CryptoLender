class AddBorrowerToLoan < ActiveRecord::Migration[5.2]
  def change
    add_reference :loans, :borrower_id, foreign_key: true
  end
end
