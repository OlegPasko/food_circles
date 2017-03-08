class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :user_id
      t.text :description
      t.string :address
      t.string :city
      t.integer :state_id
      t.string :zip
      t.string :neighborhood
      t.string :web
      t.integer :timezone_id
      t.integer :price
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
