class CreateFollowUpNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :follow_up_notes do |t|
      t.references :charity
      t.string :note

      t.timestamps
    end
    add_index :follow_up_notes, :charity_id
  end
end
