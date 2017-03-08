class CreateVenueTaggables < ActiveRecord::Migration[5.0]
  def change
    create_table :venue_taggables do |t|
      t.integer :venue_tag_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
