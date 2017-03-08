class CreateStatus < ActiveRecord::Migration[5.0]
  def change
    create_table "status", force: true do |t|
      t.string "status"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
