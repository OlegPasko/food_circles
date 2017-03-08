class AddRatingToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :rating, :float
  end
end
