class Worker < ActiveRecord::Base
  belongs_to :user
  has_many :bookings

  serialize :working_style
end
