# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


lender  = User.create({:id => 1, :first_name => "Darth", :last_name=>"Vader", 
	                   :email => "lender1@reco.com", :password => "password", 
                       :routing_number => "1234567890", :account_type => "checking", 
                       :account_number => "1029384756", :investor_status => true})

lender2 = User.create({:id => 2, :first_name => "Luke", :last_name=>"Skywalker", 
	                   :email => "lender2@reco.com", :password => "password", 
                       :routing_number => "0987654321", :account_type => "savings", 
                       :account_number =>"2468135790", :investor_status=> true})

borrower  = User.create({:id => 3, :first_name => "Han", :last_name=>"Solo", 
	                     :email => "borrower1@reco.com", :password => "password",  
	                     :routing_number => "1234567890", :account_type => "checking", 
                         :account_number =>"7788776655", :investor_status => false})

borrower2 = User.create({:id => 4, :first_name => "Boba", :last_name=>"Fett", 
	                     :email => "borrower2@reco.com", :password => "password", 
	                     :routing_number => "1234567890", :account_type => "checking", 
                         :account_number =>"0099887766", :investor_status => false})



loan_inquiry1 = LoanInquiry.create( {:borrower_id=>borrower.id, :amount => 125000.0, :rate => 2.65, :length => 12} )
loan_inquiry2 = LoanInquiry.create( {:borrower_id=>borrower.id, :amount => 1000.0, :rate => 1.0, :length => 24} )

loan_inquiry3 = LoanInquiry.create( {:borrower_id=>borrower2.id, :amount => 222.0, :rate => 1.11, :length => 12} )
loan_inquiry4 = LoanInquiry.create( {:borrower_id=>borrower2.id, :amount => 333.0, :rate => 2.22, :length => 24} )



fund_requirement1 = FundRequirement.create({:lender_id=>lender.id, :active=>true,  :amount => 11000.0, :rate => 1.00, :length => 12} )
fund_requirement2 = FundRequirement.create({:lender_id=>lender.id, :active=>false, :amount => 111000.0, :rate => 1.00, :length => 36} )

fund_requirement3 = FundRequirement.create({:lender_id=>lender2.id, :active=>false,  :amount => 15000.0, :rate => 0.25, :length => 12} )
fund_requirement4 = FundRequirement.create({:lender_id=>lender2.id, :active=>true,   :amount => 35000.0, :rate => 0.5, :length => 24} )
fund_requirement5 = FundRequirement.create({:lender_id=>lender2.id, :active=>false,  :amount => 222000.0, :rate => 0.75, :length => 48} )
