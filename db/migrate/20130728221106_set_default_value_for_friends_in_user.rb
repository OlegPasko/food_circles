class SetDefaultValueForFriendsInUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :friends, :text, null: false, default: [].to_yaml

  end
end
