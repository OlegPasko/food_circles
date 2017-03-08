class AddCodeToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :code, :string
  end
end
