class Workspace < ActiveRecord::Base
  belongs_to :business
  has_many :availabilities
  has_many :bookings

  def user
    business.user
  end
end
