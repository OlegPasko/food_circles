class DropOfferTags < ActiveRecord::Migration[5.0]
  def up
    drop_table :offer_tags
    drop_table :offer_taggables
  end

  def down
  end
end
