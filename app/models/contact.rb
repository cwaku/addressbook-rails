# frozen_string_literal: true

class Contact < ApplicationRecord
  before_save :remove_whitespaces

  attr_accessor :city_id, :region_id

  belongs_to :user
  belongs_to :suburb
  has_one :city, through: :suburb, as: :city
  has_one :region, through: :city

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :phone, presence: true

  
  # remove whitespaces from contact
  def remove_whitespaces
    self.firstname = firstname.strip
    self.lastname = lastname.strip
    self.remarks = remarks.strip
    self.phone = phone.strip
  end
end
