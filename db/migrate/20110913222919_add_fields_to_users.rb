class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :title, :string
  	add_column :users, :web_url, :string	
  end
end
