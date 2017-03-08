class AddPaypalChargeTokenToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :paypal_charge_token, :string
  end
end
