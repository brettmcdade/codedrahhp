class CreateDigitalfiles < ActiveRecord::Migration
  def change
    create_table :digitalfiles do |t|
      t.string :title	
      t.string :mp3_file_name
      t.string :mp3_content_type
      t.integer :mp3_file_size
      t.integer :user_id	

      t.timestamps
    end
  end
end
