# frozen_string_literal: true

class PermissionsRole < ApplicationRecord
  belongs_to :permissions, class_name: 'Permission', foreign_key: :permission_id
  belongs_to :role, class_name: 'Role', foreign_key: :role_code
end
