class UserRole < ApplicationRecord
    belongs_to :role, -> { where active_status: true }, class_name: "Role", foreign_key: :role_code, primary_key: :unique_code
    belongs_to :user, -> { where active_status: true }, class_name: "User", foreign_key: :user_id
end
