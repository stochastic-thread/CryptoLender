require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get toggleStatus" do
    get users_toggleStatus_url
    assert_response :success
  end

end
