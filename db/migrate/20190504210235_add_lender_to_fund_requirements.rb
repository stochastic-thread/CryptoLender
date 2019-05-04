class AddLenderToFundRequirements < ActiveRecord::Migration[5.2]
  def change
  	add_reference :fund_requirements, :lender, index: true
    add_foreign_key :fund_requirements, :users, column: :lender_id
  end
end
