class AddFinancedToFundRequirements < ActiveRecord::Migration[5.2]
  def change
    add_column :fund_requirements, :financed, :boolean, default: false
  end
end
