class Mediafile < ActiveRecord::Base
	include Extensions::UUID
	
	belongs_to :user
	
	
	has_attached_file :mp3,
                      :url => ':s3_domain_url',
                      :path => 'assets/:class/:id/:style.:extension',
                      :storage => :s3,
                      :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
                      :s3_permissions => 'authenticated-read',
                      :s3_protocol => 'http',
                      :s3_headers => { :content_type => 'application/octet-stream', :content_disposition => 'attachment' }
					
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
    
    def download_url(style = nil, include_updated_timestamp = true)
	    url = Paperclip::Interpolations.interpolate('/:class/:id/:style.:extension', mp3, style || mp3.default_style)
	    include_updated_timestamp && mp3.updated_at ? [url, mp3.updated_at].compact.join(url.include?("?") ? "&" : "?") : url
    end

  def authenticated_url(style = nil, expires_in = 10.seconds)
    AWS::S3::S3Object.url_for(mp3.path(style || mp3.default_style), mp3.bucket_name, :expires_in => expires_in, :use_ssl => mp3.s3_protocol == 'https')
  end
  
end
