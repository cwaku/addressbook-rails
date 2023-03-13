# frozen_string_literal: true

class Suburb < ApplicationRecord
  belongs_to :user
  belongs_to :city, class_name: 'City', foreign_key: 'city_id'
end
