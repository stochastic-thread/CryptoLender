class ApplicationController < ActionController::Base
  ENV['AA'] = ENV['AUTHNET_LOGIN_ID']
  ENV['AB'] = ENV['AUTHNET_TRANSACTION_KEY']
end