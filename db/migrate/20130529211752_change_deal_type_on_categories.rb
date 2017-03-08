class ChangeDealTypeOnCategories < ActiveRecord::Migration[5.0]
  def change
    rename_column :categories, :type, :deal_type
  end
end
