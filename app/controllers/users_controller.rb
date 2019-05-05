class UsersController < ApplicationController
  # before_action :authenticate_user!
  include Devise::Controllers::Helpers
  def toggle
    if user_signed_in?
      @user = current_user
      @user.investor_status = !@user.investor_status
      @user.save
    end
  end
  
  def showViableFunds
    if user_signed_in?
      @user = current_user
      

      @viable_funds = []
      isInvestor = User.find(current_user.id).investor_status

      if !isInvestor # only borrower
        @user.loan_inquiries.each do |li|

          FundRequirement.all.each do |fr|
            if fr.active &&
               li.amount <= fr.amount &&
               fr.rate   <= li.rate &&
               fr.length <= li.length
              # bld = {borrower_id: @user.id, lender_id: fr.lender_id, fund_req: fr}
              @viable_funds.push(fr)
            end
          end
        end
      end
    end
  end

end
#
# private
#   def user_params
#     params.require(:id).permit!
#     end
# end
