class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :business_name
      t.string :location
      t.integer :user_id
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size

      t.timestamps
    end
  end
end
