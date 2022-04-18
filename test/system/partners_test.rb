require "application_system_test_case"

class PartnersTest < ApplicationSystemTestCase
  setup do
    @partner = partners(:one)
  end

  test "visiting the index" do
    visit partners_url
    assert_selector "h1", text: "Partners"
  end

  test "should create partner" do
    visit partners_url
    click_on "New partner"

    fill_in "Code", with: @partner.code
    fill_in "Comment", with: @partner.comment
    fill_in "Kind", with: @partner.kind
    fill_in "Name", with: @partner.name
    fill_in "Role", with: @partner.role
    fill_in "Status", with: @partner.status
    fill_in "Title", with: @partner.title
    fill_in "Url", with: @partner.url
    click_on "Create Partner"

    assert_text "Partner was successfully created"
    click_on "Back"
  end

  test "should update Partner" do
    visit partner_url(@partner)
    click_on "Edit this partner", match: :first

    fill_in "Code", with: @partner.code
    fill_in "Comment", with: @partner.comment
    fill_in "Kind", with: @partner.kind
    fill_in "Name", with: @partner.name
    fill_in "Role", with: @partner.role
    fill_in "Status", with: @partner.status
    fill_in "Title", with: @partner.title
    fill_in "Url", with: @partner.url
    click_on "Update Partner"

    assert_text "Partner was successfully updated"
    click_on "Back"
  end

  test "should destroy Partner" do
    visit partner_url(@partner)
    click_on "Destroy this partner", match: :first

    assert_text "Partner was successfully destroyed"
  end
end
