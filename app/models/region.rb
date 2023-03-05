# frozen_string_literal: true

class Region < ApplicationRecord
  belongs_to :user
  has_many :cities
  has_many :suburbs, through: :cities
end
