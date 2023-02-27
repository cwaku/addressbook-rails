class User < ApplicationRecord
  has_many :user_roles, -> { where active_status: true }, class_name: "UserRole", foreign_key: :user_id
end
