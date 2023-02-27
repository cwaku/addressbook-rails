# frozen_string_literal: true

require 'application_system_test_case'

class PermissionsTest < ApplicationSystemTestCase
  setup do
    @permission = permissions(:one)
  end

  test 'visiting the index' do
    visit permissions_url
    assert_selector 'h1', text: 'Permissions'
  end

  test 'should create permission' do
    visit permissions_url
    click_on 'New permission'

    fill_in 'Action', with: @permission.action
    fill_in 'Created at', with: @permission.created_at
    fill_in 'Description', with: @permission.description
    fill_in 'Name', with: @permission.name
    fill_in 'Subject class', with: @permission.subject_class
    fill_in 'Updated at', with: @permission.updated_at
    click_on 'Create Permission'

    assert_text 'Permission was successfully created'
    click_on 'Back'
  end

  test 'should update Permission' do
    visit permission_url(@permission)
    click_on 'Edit this permission', match: :first

    fill_in 'Action', with: @permission.action
    fill_in 'Created at', with: @permission.created_at
    fill_in 'Description', with: @permission.description
    fill_in 'Name', with: @permission.name
    fill_in 'Subject class', with: @permission.subject_class
    fill_in 'Updated at', with: @permission.updated_at
    click_on 'Update Permission'

    assert_text 'Permission was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Permission' do
    visit permission_url(@permission)
    click_on 'Destroy this permission', match: :first

    assert_text 'Permission was successfully destroyed'
  end
end
