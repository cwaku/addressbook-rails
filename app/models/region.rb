# frozen_string_literal: true

class Region < ApplicationRecord
  belongs_to :user
  has_many :cities
  has_many :suburbs, through: :cities
  has_many :contacts, through: :suburbs

  validates :name, presence: true

  # remove whitespaces from region
  before_save :remove_whitespaces

  def remove_whitespaces
    self.name = name.strip
    self.remarks = remarks.strip
  end
end
