class AddCharityToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :charity, :integer
  end
end
