class RenameThumbnailToOutdoor < ActiveRecord::Migration[5.0]
  def change
    rename_column :venues, :thumbnail_image_uid, :outside_image_uid
  end

end
