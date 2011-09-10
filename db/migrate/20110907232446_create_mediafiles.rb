class CreateMediafiles < ActiveRecord::Migration
  def change
    create_table(:mediafiles, :id => false) do |t|
      t.string :uuid, :limit => 16, :primary => true
      t.integer :user_id
      t.string :title	
      t.string :mp3_file_name
      t.string :mp3_content_type
      t.integer :mp3_file_size

      t.timestamps
    end
  end
end
