class RenameUserFacebokToFacebook < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :facebok_token, :facebook_token

  end
end
