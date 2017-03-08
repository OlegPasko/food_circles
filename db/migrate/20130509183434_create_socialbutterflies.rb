class CreateSocialbutterflies < ActiveRecord::Migration[5.0]
  def change
    create_table :socialbutterflies do |t|
      t.string :facebook

      t.timestamps
    end
  end
end
