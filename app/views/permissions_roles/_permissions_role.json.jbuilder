# frozen_string_literal: true

json.extract! permissions_role, :id, :permission_id, :role_id, :role_code, :created_at, :updated_at, :created_at,
              :updated_at
json.url permissions_role_url(permissions_role, format: :json)
