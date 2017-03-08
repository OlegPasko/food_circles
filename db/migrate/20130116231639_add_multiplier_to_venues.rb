class AddMultiplierToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :multiplier, :decimal, default: 1.50

  end
end
