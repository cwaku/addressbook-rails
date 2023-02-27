# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :user_roles, class_name: 'UserRole', foreign_key: :role_code, primary_key: :unique_code
  has_and_belongs_to_many :permissions, foreign_key: :role_code
end
