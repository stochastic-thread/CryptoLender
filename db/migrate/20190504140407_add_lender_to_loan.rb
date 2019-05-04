class AddLenderToLoan < ActiveRecord::Migration[5.2]
  def change
    add_reference :loans, :lender, index: true
    add_foreign_key :loans, :users, column: :lender_id
  end
end
