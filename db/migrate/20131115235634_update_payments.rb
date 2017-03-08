class UpdatePayments < ActiveRecord::Migration[5.0]
  def up
    rename_column :payments, :charity, :charity_id
  end

  def down
    rename_column :payments, :charity_id, :charity
  end
end
