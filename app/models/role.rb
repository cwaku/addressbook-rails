# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :user_roles, class_name: 'UserRole', foreign_key: :role_code, primary_key: :unique_code
  has_and_belongs_to_many :permissions, foreign_key: :role_code

  # TODO: Fix this
  def set_permissions(permissions)
    permissions.each do |id|
      permission = Permission.find(id)
      self.permissions << permission
      case permission.subject_class
      when "Part"
        case permission.actionm
        when "create"
          self.permissions << Permission.where(subject_class: "Drawing", action: "create")
        when "update"
          self.permissions << Permission.where(subject_class: "Drawing", action: ["update", "destroy"])
        end
      end
    end
  end
end
