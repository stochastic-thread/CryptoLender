class FundRequirement < ApplicationRecord
	belongs_to :lender, class_name: "User"
end
