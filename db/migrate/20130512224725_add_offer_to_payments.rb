class AddOfferToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :offer_id, :integer

  end
end
