class AddActiveToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :active, :boolean, default: true
  end
end
