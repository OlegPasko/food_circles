class CreateCharityPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :charity_photos do |t|
      t.attachment :photo
      t.integer :charity_id

      t.timestamps
    end
  end
end
