class AddTokenToDigitalfile < ActiveRecord::Migration
  def change
    add_column :digitalfiles, :token, :string
  end
end
