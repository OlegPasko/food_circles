class AddActiveToCharities < ActiveRecord::Migration[5.0]
  def change
    add_column :charities, :active, :boolean, default: true
  end
end
