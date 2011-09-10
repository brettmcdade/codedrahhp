class AddPhotosToUser < ActiveRecord::Migration
  def change
    add_column :users, :photo_file_name, :string
    add_column :users, :photo_file_size, :integer
    add_column :users, :photo_content_type, :string
  end
end
