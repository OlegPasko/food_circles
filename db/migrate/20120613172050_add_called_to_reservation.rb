class AddCalledToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :called, :boolean, default: false

  end
end
