class SetDefaultValuesForSocialBools < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :has_twitter, :boolean, null: false, default: false
    change_column :users, :has_facebook, :boolean, null: false, default: false

  end
end
