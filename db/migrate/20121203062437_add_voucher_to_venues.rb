class AddVoucherToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :voucher, :string, default: 5

  end
end
