# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :user
  belongs_to :region
  has_many :suburbs
  has_many :contacts, through: :suburbs

  validates :name, presence: true

  # remove whitespaces from city
  before_save :remove_whitespaces

  def remove_whitespaces
    self.city_name = name.strip
    self.remarks = remarks.strip
  end
end
