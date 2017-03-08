class CreateNotificationRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :notification_requests do |t|
      t.references :user
      t.references :venue

      t.timestamps
    end
  end
end
