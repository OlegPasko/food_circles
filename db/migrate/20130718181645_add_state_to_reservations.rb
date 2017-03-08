class AddStateToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :state, :string
  end
end
