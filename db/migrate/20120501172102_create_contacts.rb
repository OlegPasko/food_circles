class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :content
      t.integer :contact_type_id
      t.references :contactable, polymorphic: true

      t.timestamps
    end
  end
end
