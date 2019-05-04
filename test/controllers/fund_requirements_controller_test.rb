require 'test_helper'

class FundRequirementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fund_requirement = fund_requirements(:one)
  end

  test "should get index" do
    get fund_requirements_url
    assert_response :success
  end

  test "should get new" do
    get new_fund_requirement_url
    assert_response :success
  end

  test "should create fund_requirement" do
    assert_difference('FundRequirement.count') do
      post fund_requirements_url, params: { fund_requirement: { amount: @fund_requirement.amount, length: @fund_requirement.length, rate: @fund_requirement.rate } }
    end

    assert_redirected_to fund_requirement_url(FundRequirement.last)
  end

  test "should show fund_requirement" do
    get fund_requirement_url(@fund_requirement)
    assert_response :success
  end

  test "should get edit" do
    get edit_fund_requirement_url(@fund_requirement)
    assert_response :success
  end

  test "should update fund_requirement" do
    patch fund_requirement_url(@fund_requirement), params: { fund_requirement: { amount: @fund_requirement.amount, length: @fund_requirement.length, rate: @fund_requirement.rate } }
    assert_redirected_to fund_requirement_url(@fund_requirement)
  end

  test "should destroy fund_requirement" do
    assert_difference('FundRequirement.count', -1) do
      delete fund_requirement_url(@fund_requirement)
    end

    assert_redirected_to fund_requirements_url
  end
end
