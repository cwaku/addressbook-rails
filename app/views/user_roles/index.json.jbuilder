# frozen_string_literal: true

json.array! @user_roles, partial: 'user_roles/user_role', as: :user_role
