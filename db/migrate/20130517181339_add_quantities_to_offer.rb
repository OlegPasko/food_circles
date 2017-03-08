class AddQuantitiesToOffer < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :available, :integer
    add_column :offers, :total, :integer
  end
end
