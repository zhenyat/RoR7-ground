require "application_system_test_case"

class Admin::BanksTest < ApplicationSystemTestCase
  setup do
    @admin_bank = admin_banks(:one)
  end

  test "visiting the index" do
    visit admin_banks_url
    assert_selector "h1", text: "Banks"
  end

  test "should create bank" do
    visit admin_banks_url
    click_on "New bank"

    fill_in "Bic", with: @admin_bank.bic
    fill_in "Comment", with: @admin_bank.comment
    fill_in "Name", with: @admin_bank.name
    fill_in "Status", with: @admin_bank.status
    fill_in "Title", with: @admin_bank.title
    fill_in "Url", with: @admin_bank.url
    click_on "Create Bank"

    assert_text "Bank was successfully created"
    click_on "Back"
  end

  test "should update Bank" do
    visit admin_bank_url(@admin_bank)
    click_on "Edit this bank", match: :first

    fill_in "Bic", with: @admin_bank.bic
    fill_in "Comment", with: @admin_bank.comment
    fill_in "Name", with: @admin_bank.name
    fill_in "Status", with: @admin_bank.status
    fill_in "Title", with: @admin_bank.title
    fill_in "Url", with: @admin_bank.url
    click_on "Update Bank"

    assert_text "Bank was successfully updated"
    click_on "Back"
  end

  test "should destroy Bank" do
    visit admin_bank_url(@admin_bank)
    click_on "Destroy this bank", match: :first

    assert_text "Bank was successfully destroyed"
  end
end
