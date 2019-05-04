require 'test_helper'

class LoanInquiriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan_inquiry = loan_inquiries(:one)
  end

  test "should get index" do
    get loan_inquiries_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_inquiry_url
    assert_response :success
  end

  test "should create loan_inquiry" do
    assert_difference('LoanInquiry.count') do
      post loan_inquiries_url, params: { loan_inquiry: { amount: @loan_inquiry.amount, length: @loan_inquiry.length, rate: @loan_inquiry.rate } }
    end

    assert_redirected_to loan_inquiry_url(LoanInquiry.last)
  end

  test "should show loan_inquiry" do
    get loan_inquiry_url(@loan_inquiry)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_inquiry_url(@loan_inquiry)
    assert_response :success
  end

  test "should update loan_inquiry" do
    patch loan_inquiry_url(@loan_inquiry), params: { loan_inquiry: { amount: @loan_inquiry.amount, length: @loan_inquiry.length, rate: @loan_inquiry.rate } }
    assert_redirected_to loan_inquiry_url(@loan_inquiry)
  end

  test "should destroy loan_inquiry" do
    assert_difference('LoanInquiry.count', -1) do
      delete loan_inquiry_url(@loan_inquiry)
    end

    assert_redirected_to loan_inquiries_url
  end
end
