class CreateLongTasks < ActiveRecord::Migration[5.0]
  def change
    create_table "long_tasks", force: true
  end
end
