# frozen_string_literal: true

json.extract! suburb, :id, :name, :remarks, :user_id, :city_id, :created_at, :updated_at
json.url suburb_url(suburb, format: :json)
