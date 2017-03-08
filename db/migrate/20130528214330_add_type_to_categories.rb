class AddTypeToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :type, :string
  end
end
