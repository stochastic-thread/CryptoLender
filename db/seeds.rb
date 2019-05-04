# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'first line'
# puts LoanInquiry.exists?
# puts Loan.exists?
# puts User.exists?

borrower = User.create({ :email => "borrower1@reco.com", password: "password", investor_status: false})
lender = User.create({ :email => "lender1@reco.com", password: "password", investor_status: true})


loan_inquiry1 = LoanInquiry.create( {:borrower_id=>borrower.id, :amount => 125000.0, :rate => 2.65, :length => 365,} )
loan_inquiry2 = LoanInquiry.create( {:borrower_id=>borrower.id,:amount => 1000.0, :rate => 1.0, :length => 730} )

ap loan_inquiry1
ap loan_inquiry2

puts 'second line'



ap borrower
ap lender