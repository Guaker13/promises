class Workspace < ActiveRecord::Base
  belongs_to :business
  belongs_to :user, through: :business
  has_many :availabilities
  has_many :bookings
end
