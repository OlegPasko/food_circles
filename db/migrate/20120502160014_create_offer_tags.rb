class CreateOfferTags < ActiveRecord::Migration[5.0]
  def change
    create_table :offer_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
