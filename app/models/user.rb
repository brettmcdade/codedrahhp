class User < ActiveRecord::Base
	
  has_one :profile, :dependent => :destroy
  has_many :mediafiles, :dependent => :destroy
  accepts_nested_attributes_for :mediafiles
  	
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :photo, :title, :web_url, :username
  
  has_attached_file :photo,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>" }
  
  # Validating the presence of the username attribute
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_format_of :username, :with => /\A[A-Za-z0-9_]+\z/
  validates_length_of :username, :maximum => 32
  
  # Creates a way for me to put username into the user route instead of just the id
  def to_param
  	username
  end
 
  
  def strip_and_downcase_name
    if username.present?
      username.strip!
      username.downcase!
    end
  end
  
end
