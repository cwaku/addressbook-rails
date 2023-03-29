# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_role, -> { where active_status: true, del_status: false }, class_name: 'UserRole', foreign_key: :user_id
  has_many :roles, through: :user_role, class_name: 'Role', foreign_key: :role_code
  has_many :contacts, -> { where active: true, del: false }, class_name: 'Contact'

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true

  # remove whitespaces from user
  before_save :remove_whitespaces

  def remove_whitespaces
    self.firstname = firstname.strip
    self.lastname = lastname.strip
    self.email = email.strip
  end

  def super_admin?
    roles.where(unique_code: 'SA').present?
  end
end
