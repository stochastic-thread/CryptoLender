class AddFirstLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :routing_number, :string
    add_column :users, :account_type, :string
    add_column :users, :account_number, :string
  end
end
