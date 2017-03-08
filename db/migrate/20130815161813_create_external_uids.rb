class CreateExternalUids < ActiveRecord::Migration[5.0]
  def change
    create_table :external_uids do |t|
      t.references :user
      t.string :uid

      t.timestamps
    end
  end
end
