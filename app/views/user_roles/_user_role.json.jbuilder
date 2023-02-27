# frozen_string_literal: true

json.extract! user_role, :id, :role_code, :user_id, :active_status, :del_status, :created_at, :updated_at, :created_at,
              :updated_at
json.url user_role_url(user_role, format: :json)
