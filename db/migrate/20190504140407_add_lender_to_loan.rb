class AddLenderToLoan < ActiveRecord::Migration[5.2]
  def change
    add_reference :loans, :lender_id, foreign_key: true
  end
end
