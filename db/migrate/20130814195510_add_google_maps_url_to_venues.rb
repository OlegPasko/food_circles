class AddGoogleMapsUrlToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :google_maps_url, :string
  end
end
