class AddDeviceIdToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :device_id, :string
  end
end
