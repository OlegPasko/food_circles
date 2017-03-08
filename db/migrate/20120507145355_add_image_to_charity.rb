class AddImageToCharity < ActiveRecord::Migration[5.0]
  def change
    add_column :charities, :image_uid, :string
  end
end
