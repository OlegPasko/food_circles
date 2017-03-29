class RenameLocationColumnsInVenue < ActiveRecord::Migration[5.0]
  def change
    rename_column :venues, :lat, :latitude
    rename_column :venues, :lon, :longitude
  end
end
