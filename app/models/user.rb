class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :loan_inquiries, foreign_key: "borrower_id", class_name: "LoanInquiry"
  has_many :fund_requirements, foreign_key: "lender_id", class_name: "FundRequirement"
end