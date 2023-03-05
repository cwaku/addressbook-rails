# frozen_string_literal: true

class Contact < ApplicationRecord
  attr_accessor :region_id, :city_id, :suburb_id

  belongs_to :user
  belongs_to :suburb
  belongs_to :city, optional: true
  belongs_to :region, optional: true
end
