class AddInvestorStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :investor_status, :boolean, default: false
  end
end
