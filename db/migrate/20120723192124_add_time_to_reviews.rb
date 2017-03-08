class AddTimeToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :time, :integer
  end
end
