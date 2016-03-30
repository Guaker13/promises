class Picture < ActiveRecord::Base
  belongs_to :workspace
  mount_uploader :photo, PhotoUploader
end
