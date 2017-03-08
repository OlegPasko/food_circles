class AddPricesToOffer < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :price, :float
    add_column :offers, :original_price, :float
  end
end
