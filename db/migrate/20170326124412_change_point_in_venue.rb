class ChangePointInVenue < ActiveRecord::Migration
  def change
    add_column :venues, :lon, :float
    remove_column :venues, :latlon
    add_column :venues, :lat, :float
  end
end
