class RenameLinkToPhotoInPictures < ActiveRecord::Migration
  def change
    rename_column :pictures, :link, :photo
  end
end
