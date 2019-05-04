# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


borrower = User.create({ :email => "borrower1@reco.com", password: "password", investor_status: false})
lender = User.create({ :email => "lender1@reco.com", password: "password", investor_status: true})