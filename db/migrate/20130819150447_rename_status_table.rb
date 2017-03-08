class RenameStatusTable < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :status, :statuses
  end

  def self.down
    rename_table :statuses, :status
  end
end
