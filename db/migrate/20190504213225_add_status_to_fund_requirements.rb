class AddStatusToFundRequirements < ActiveRecord::Migration[5.2]
  def change
  	add_column :fund_requirements, :active, :boolean, default: false
  end
end
