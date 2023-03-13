# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :user_roles, class_name: 'UserRole', foreign_key: :role_code, primary_key: :unique_code
  has_and_belongs_to_many :permissions, foreign_key: :role_code

  validates :name, presence: true

  # remove whitespaces from role
  before_save :remove_whitespaces

  def remove_whitespaces
    self.name = name.strip
    self.unique_code = unique_code.strip
  end

  # TODO: Fix this
  # Sets the permissions on this object.
  def set_permissions(permissions)
                  permissions.each do |id|
                    permission = Permission.find(id)
                    self.permissions << permission
                    case permission.subject_class
                    when 'Contact'
                      case permission.action
                      when 'create'
                        self.permissions << Permission.where(subject_class: 'Contact',
                                                             action: 'create')
                      when 'update'
                        self.permissions << Permission.where(subject_class: 'Contact',
                                                             action: %w[
                                                               update destroy
                                                             ])
                      end
                    when 'Region'
                      case permission.action
                      when 'create'
                        self.permissions << Permission.where(subject_class: 'Region',
                                                             action: 'create')
                      when 'update'
                        self.permissions << Permission.where(subject_class: 'Region',
                                                             action: %w[
                                                               update destroy
                                                             ])
                      end
                    when 'Suburb'
                      case permission.action
                      when 'create'
                        self.permissions << Permission.where(subject_class: 'Suburb',
                                                             action: 'create')
                      when 'update'
                        self.permissions << Permission.where(subject_class: 'Suburb',
                                                             action: %w[
                                                               update destroy
                                                             ])
                      end
                    when 'City'
                      case permission.action
                      when 'create'
                        self.permissions << Permission.where(subject_class: 'City',
                                                             action: 'create')
                      when 'update'
                        self.permissions << Permission.where(subject_class: 'City',
                                                             action: %w[
                                                               update destroy
                                                             ])
                      end
                    end
                  end
  end
end
