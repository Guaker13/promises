class Business < ActiveRecord::Base
  belongs_to :user
  has_many :workspaces
  has_many :availabilities, through: :workspaces
  has_many :bookings, through: :workspaces
end
