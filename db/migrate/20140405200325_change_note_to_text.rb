class ChangeNoteToText < ActiveRecord::Migration[5.0]
  def up
    change_column :follow_up_notes, :note, :text
  end

  def down
    change_column :follow_up_notes, :note, :string
  end
end
