# frozen_string_literal: true

class CreateUserRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_roles do |t|
      t.string :role_code
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
