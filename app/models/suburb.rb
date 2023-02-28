# frozen_string_literal: true

class Suburb < ApplicationRecord
  belongs_to :user
  belongs_to :city
end