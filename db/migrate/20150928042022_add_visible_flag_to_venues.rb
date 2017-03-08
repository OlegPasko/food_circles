class AddVisibleFlagToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :visible, :boolean, default: true
  end
end
