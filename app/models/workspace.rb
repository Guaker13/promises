class Workspace < ActiveRecord::Base
  belongs_to :business
  has_many :unavailabilities
  has_many :bookings
  has_many :pictures
  accepts_nested_attributes_for :pictures

  def user
    business.user
  end
end
