class AddFriendToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :friend, :string
  end
end
