class AddTimesToVenueAndOffer < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :times, :string
    add_column :offers, :times, :string
  end
end
