class Mediafile < ActiveRecord::Base
	include Extensions::UUID
	
	belongs_to :user
	belongs_to :profile
	
	has_attached_file :mp3,
                    :url => '/:class/:id/:style/:basename.:extension',
                    :path => ':rails_root/assets/:class/:id_partition/:style/:basename.:extension'
					
    attr_protected :mp3_file_name, :mp3_content_type, :mp3_file_size
                    
    validates_attachment_presence :mp3
    validates_attachment_content_type :mp3, :content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ]
    validates_attachment_size :mp3, :less_than => 20.megabytes

    def downloadable?(user)
      user != :guest
    end
    
    def to_param
    	uuid
    end
   
  
    # Setup accessible (or protected) attributes for your model
    attr_accessible :mp3
end
