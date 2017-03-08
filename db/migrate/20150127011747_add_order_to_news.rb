class AddOrderToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :order, :integer
  end
end
