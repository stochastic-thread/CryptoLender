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

  end
#
# private
#   def user_params
#     params.require(:id).permit!
#     end
# end
