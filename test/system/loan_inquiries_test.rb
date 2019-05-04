require "application_system_test_case"

class LoanInquiriesTest < ApplicationSystemTestCase
  setup do
    @loan_inquiry = loan_inquiries(:one)
  end

  test "visiting the index" do
    visit loan_inquiries_url
    assert_selector "h1", text: "Loan Inquiries"
  end

  test "creating a Loan inquiry" do
    visit loan_inquiries_url
    click_on "New Loan Inquiry"

    fill_in "Amount", with: @loan_inquiry.amount
    fill_in "Length", with: @loan_inquiry.length
    fill_in "Rate", with: @loan_inquiry.rate
    click_on "Create Loan inquiry"

    assert_text "Loan inquiry was successfully created"
    click_on "Back"
  end

  test "updating a Loan inquiry" do
    visit loan_inquiries_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @loan_inquiry.amount
    fill_in "Length", with: @loan_inquiry.length
    fill_in "Rate", with: @loan_inquiry.rate
    click_on "Update Loan inquiry"

    assert_text "Loan inquiry was successfully updated"
    click_on "Back"
  end

  test "destroying a Loan inquiry" do
    visit loan_inquiries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loan inquiry was successfully destroyed"
  end
end
