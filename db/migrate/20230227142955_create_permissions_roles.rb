# frozen_string_literal: true

class CreatePermissionsRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :permissions_roles do |t|
      t.integer :permission_id
      t.integer :role_id
      t.string :role_code
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
