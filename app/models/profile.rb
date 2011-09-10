class Profile < ActiveRecord::Base
	
  belongs_to :user
  
  has_attached_file :photo,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>" }
   
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :business_name, :location, :photo
end
