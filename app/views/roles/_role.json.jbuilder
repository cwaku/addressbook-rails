# frozen_string_literal: true

json.extract! role, :id, :name, :unique_code, :active_status, :del_status, :created_at, :updated_at
json.url role_url(role, format: :json)
