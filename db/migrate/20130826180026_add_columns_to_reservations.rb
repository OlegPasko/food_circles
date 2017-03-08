class AddColumnsToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :amount, :float
    add_column :reservations, :code, :string
  end
end
