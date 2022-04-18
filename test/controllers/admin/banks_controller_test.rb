require "test_helper"

class Admin::BanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_bank = admin_banks(:one)
  end

  test "should get index" do
    get admin_banks_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_bank_url
    assert_response :success
  end

  test "should create admin_bank" do
    assert_difference("Admin::Bank.count") do
      post admin_banks_url, params: { admin_bank: { bic: @admin_bank.bic, comment: @admin_bank.comment, name: @admin_bank.name, status: @admin_bank.status, title: @admin_bank.title, url: @admin_bank.url } }
    end

    assert_redirected_to admin_bank_url(Admin::Bank.last)
  end

  test "should show admin_bank" do
    get admin_bank_url(@admin_bank)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_bank_url(@admin_bank)
    assert_response :success
  end

  test "should update admin_bank" do
    patch admin_bank_url(@admin_bank), params: { admin_bank: { bic: @admin_bank.bic, comment: @admin_bank.comment, name: @admin_bank.name, status: @admin_bank.status, title: @admin_bank.title, url: @admin_bank.url } }
    assert_redirected_to admin_bank_url(@admin_bank)
  end

  test "should destroy admin_bank" do
    assert_difference("Admin::Bank.count", -1) do
      delete admin_bank_url(@admin_bank)
    end

    assert_redirected_to admin_banks_url
  end
end
