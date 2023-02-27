require "application_system_test_case"

class RolesTest < ApplicationSystemTestCase
  setup do
    @role = roles(:one)
  end

  test "visiting the index" do
    visit roles_url
    assert_selector "h1", text: "Roles"
  end

  test "should create role" do
    visit roles_url
    click_on "New role"

    check "Active status" if @role.active_status
    check "Del status" if @role.del_status
    fill_in "Name", with: @role.name
    fill_in "Unique code", with: @role.unique_code
    click_on "Create Role"

    assert_text "Role was successfully created"
    click_on "Back"
  end

  test "should update Role" do
    visit role_url(@role)
    click_on "Edit this role", match: :first

    check "Active status" if @role.active_status
    check "Del status" if @role.del_status
    fill_in "Name", with: @role.name
    fill_in "Unique code", with: @role.unique_code
    click_on "Update Role"

    assert_text "Role was successfully updated"
    click_on "Back"
  end

  test "should destroy Role" do
    visit role_url(@role)
    click_on "Destroy this role", match: :first

    assert_text "Role was successfully destroyed"
  end
end
