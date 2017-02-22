class SetDefaultValueForFriendsInUser < ActiveRecord::Migration
  def change
    change_column :users, :friends, :text, null: false, default: [].to_yaml

  end
end
