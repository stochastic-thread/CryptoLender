class CreateFundRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :fund_requirements do |t|
      t.decimal :amount
      t.decimal :rate
      t.integer :length

      t.timestamps
    end
  end
end
