class CreateLoanInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :loan_inquiries do |t|
      t.decimal :amount
      t.decimal :rate
      t.integer :length
      t.timestamps
    end
  end
end
