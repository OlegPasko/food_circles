class CreateVouchers < ActiveRecord::Migration[5.0]
  def change
    create_table :vouchers do |t|
      t.date :start
      t.date :end
      t.integer :total
      t.integer :available
      t.references :offer

      t.timestamps
    end
    add_index :vouchers, :offer_id
  end
end
