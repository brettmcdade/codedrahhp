class AddUuidToDigitalfile < ActiveRecord::Migration
  def change
    add_column :digitalfiles, :uuid, :string, :limit => 16, :primary => true
  end
end
