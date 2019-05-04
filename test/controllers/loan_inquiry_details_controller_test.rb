require 'test_helper'

class LoanInquiryDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan_inquiry_detail = loan_inquiry_details(:one)
  end

  test "should get index" do
    get loan_inquiry_details_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_inquiry_detail_url
    assert_response :success
  end

  test "should create loan_inquiry_detail" do
    assert_difference('LoanInquiryDetail.count') do
      post loan_inquiry_details_url, params: { loan_inquiry_detail: { bankruptcy_count: @loan_inquiry_detail.bankruptcy_count, city: @loan_inquiry_detail.city, damage_type: @loan_inquiry_detail.damage_type, damaged_address: @loan_inquiry_detail.damaged_address, date_established: @loan_inquiry_detail.date_established, estimated_loss: @loan_inquiry_detail.estimated_loss, headcount: @loan_inquiry_detail.headcount, industry: @loan_inquiry_detail.industry, insured: @loan_inquiry_detail.insured, mailing_address: @loan_inquiry_detail.mailing_address, organization_type: @loan_inquiry_detail.organization_type, previous_bankruptcy: @loan_inquiry_detail.previous_bankruptcy, project_name: @loan_inquiry_detail.project_name, revenue: @loan_inquiry_detail.revenue, state: @loan_inquiry_detail.state } }
    end

    assert_redirected_to loan_inquiry_detail_url(LoanInquiryDetail.last)
  end

  test "should show loan_inquiry_detail" do
    get loan_inquiry_detail_url(@loan_inquiry_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_inquiry_detail_url(@loan_inquiry_detail)
    assert_response :success
  end

  test "should update loan_inquiry_detail" do
    patch loan_inquiry_detail_url(@loan_inquiry_detail), params: { loan_inquiry_detail: { bankruptcy_count: @loan_inquiry_detail.bankruptcy_count, city: @loan_inquiry_detail.city, damage_type: @loan_inquiry_detail.damage_type, damaged_address: @loan_inquiry_detail.damaged_address, date_established: @loan_inquiry_detail.date_established, estimated_loss: @loan_inquiry_detail.estimated_loss, headcount: @loan_inquiry_detail.headcount, industry: @loan_inquiry_detail.industry, insured: @loan_inquiry_detail.insured, mailing_address: @loan_inquiry_detail.mailing_address, organization_type: @loan_inquiry_detail.organization_type, previous_bankruptcy: @loan_inquiry_detail.previous_bankruptcy, project_name: @loan_inquiry_detail.project_name, revenue: @loan_inquiry_detail.revenue, state: @loan_inquiry_detail.state } }
    assert_redirected_to loan_inquiry_detail_url(@loan_inquiry_detail)
  end

  test "should destroy loan_inquiry_detail" do
    assert_difference('LoanInquiryDetail.count', -1) do
      delete loan_inquiry_detail_url(@loan_inquiry_detail)
    end

    assert_redirected_to loan_inquiry_details_url
  end
end
