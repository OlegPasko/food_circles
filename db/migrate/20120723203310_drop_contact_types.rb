class DropContactTypes < ActiveRecord::Migration[5.0]
  def up
    drop_table :contact_types
    drop_table :contacts
  end

  def down
  end
end
