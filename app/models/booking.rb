class Booking < ActiveRecord::Base
  belongs_to :worker
  belongs_to :workspace
end
