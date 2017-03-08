class AddCircleImageToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :circle_image_uid, :string
  end
end
