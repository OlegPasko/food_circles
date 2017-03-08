class AddLatLonToCharities < ActiveRecord::Migration[5.0]
  def change
    add_column :charities, :latitude, :float
    add_column :charities, :longitude, :float
  end
end
