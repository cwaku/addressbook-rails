# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_role, -> { where active_status: true, del_status: false }, class_name: "UserRole", foreign_key: :user_id
  has_many :roles, through: :user_roles, primary_key: :role_code
end
