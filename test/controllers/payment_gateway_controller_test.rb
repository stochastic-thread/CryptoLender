require 'test_helper'

class PaymentGatewayControllerTest < ActionDispatch::IntegrationTest
  test "should get create_transaction" do
    get payment_gateway_create_transaction_url
    assert_response :success
  end

end
