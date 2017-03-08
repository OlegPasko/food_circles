class AddEmailToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :email, :string, default: "venue@example.com"

  end
end
