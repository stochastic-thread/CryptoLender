require "application_system_test_case"

class FundRequirementsTest < ApplicationSystemTestCase
  setup do
    @fund_requirement = fund_requirements(:one)
  end

  test "visiting the index" do
    visit fund_requirements_url
    assert_selector "h1", text: "Fund Requirements"
  end

  test "creating a Fund requirement" do
    visit fund_requirements_url
    click_on "New Fund Requirement"

    fill_in "Amount", with: @fund_requirement.amount
    fill_in "Length", with: @fund_requirement.length
    fill_in "Rate", with: @fund_requirement.rate
    click_on "Create Fund requirement"

    assert_text "Fund requirement was successfully created"
    click_on "Back"
  end

  test "updating a Fund requirement" do
    visit fund_requirements_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @fund_requirement.amount
    fill_in "Length", with: @fund_requirement.length
    fill_in "Rate", with: @fund_requirement.rate
    click_on "Update Fund requirement"

    assert_text "Fund requirement was successfully updated"
    click_on "Back"
  end

  test "destroying a Fund requirement" do
    visit fund_requirements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fund requirement was successfully destroyed"
  end
end
