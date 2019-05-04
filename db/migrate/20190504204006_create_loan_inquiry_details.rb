class CreateLoanInquiryDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :loan_inquiry_details do |t|
      t.string :project_name
      t.string :damage_type
      t.string :organization_type
      t.string :damaged_address
      t.string :city
      t.string :state
      t.boolean :insured
      t.decimal :revenue
      t.decimal :estimated_loss
      t.integer :headcount
      t.string :industry
      t.string :date_established
      t.boolean :previous_bankruptcy
      t.integer :bankruptcy_count
      t.string :mailing_address

      t.timestamps
    end
  end
end
