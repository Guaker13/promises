class Workspace < ActiveRecord::Base
	belongs_to :business
	has_many :unavailabilities
	has_many :bookings
	has_many :pictures
	accepts_nested_attributes_for :pictures

	geocoded_by :location
	after_validation :geocode, if: :location_changed?

	def user
		business.user
	end
end
