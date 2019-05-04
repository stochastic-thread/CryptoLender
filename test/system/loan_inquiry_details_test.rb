require "application_system_test_case"

class LoanInquiryDetailsTest < ApplicationSystemTestCase
  setup do
    @loan_inquiry_detail = loan_inquiry_details(:one)
  end

  test "visiting the index" do
    visit loan_inquiry_details_url
    assert_selector "h1", text: "Loan Inquiry Details"
  end

  test "creating a Loan inquiry detail" do
    visit loan_inquiry_details_url
    click_on "New Loan Inquiry Detail"

    fill_in "Bankruptcy count", with: @loan_inquiry_detail.bankruptcy_count
    fill_in "City", with: @loan_inquiry_detail.city
    fill_in "Damage type", with: @loan_inquiry_detail.damage_type
    fill_in "Damaged address", with: @loan_inquiry_detail.damaged_address
    fill_in "Date established", with: @loan_inquiry_detail.date_established
    fill_in "Estimated loss", with: @loan_inquiry_detail.estimated_loss
    fill_in "Headcount", with: @loan_inquiry_detail.headcount
    fill_in "Industry", with: @loan_inquiry_detail.industry
    check "Insured" if @loan_inquiry_detail.insured
    fill_in "Mailing address", with: @loan_inquiry_detail.mailing_address
    fill_in "Organization type", with: @loan_inquiry_detail.organization_type
    check "Previous bankruptcy" if @loan_inquiry_detail.previous_bankruptcy
    fill_in "Project name", with: @loan_inquiry_detail.project_name
    fill_in "Revenue", with: @loan_inquiry_detail.revenue
    fill_in "State", with: @loan_inquiry_detail.state
    click_on "Create Loan inquiry detail"

    assert_text "Loan inquiry detail was successfully created"
    click_on "Back"
  end

  test "updating a Loan inquiry detail" do
    visit loan_inquiry_details_url
    click_on "Edit", match: :first

    fill_in "Bankruptcy count", with: @loan_inquiry_detail.bankruptcy_count
    fill_in "City", with: @loan_inquiry_detail.city
    fill_in "Damage type", with: @loan_inquiry_detail.damage_type
    fill_in "Damaged address", with: @loan_inquiry_detail.damaged_address
    fill_in "Date established", with: @loan_inquiry_detail.date_established
    fill_in "Estimated loss", with: @loan_inquiry_detail.estimated_loss
    fill_in "Headcount", with: @loan_inquiry_detail.headcount
    fill_in "Industry", with: @loan_inquiry_detail.industry
    check "Insured" if @loan_inquiry_detail.insured
    fill_in "Mailing address", with: @loan_inquiry_detail.mailing_address
    fill_in "Organization type", with: @loan_inquiry_detail.organization_type
    check "Previous bankruptcy" if @loan_inquiry_detail.previous_bankruptcy
    fill_in "Project name", with: @loan_inquiry_detail.project_name
    fill_in "Revenue", with: @loan_inquiry_detail.revenue
    fill_in "State", with: @loan_inquiry_detail.state
    click_on "Update Loan inquiry detail"

    assert_text "Loan inquiry detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Loan inquiry detail" do
    visit loan_inquiry_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loan inquiry detail was successfully destroyed"
  end
end
