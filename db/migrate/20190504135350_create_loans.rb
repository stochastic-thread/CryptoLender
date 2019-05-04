class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.decimal :principal_balance
      t.decimal :interest_rate
      t.integer :days_to_maturity

      t.timestamps
    end
  end
end
