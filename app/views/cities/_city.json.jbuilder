# frozen_string_literal: true

json.extract! city, :id, :name, :remarks, :user_id, :region_id, :created_at, :updated_at
json.url city_url(city, format: :json)
