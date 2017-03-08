class AddReferenceToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :reference, :string

  end
end
