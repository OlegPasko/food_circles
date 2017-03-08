class AddImageToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :image_uid, :string
  end
end
