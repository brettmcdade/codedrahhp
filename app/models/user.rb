class User < ActiveRecord::Base
	
  has_one :profile, :dependent => :destroy
  has_many :mediafiles, :dependent => :destroy
  accepts_nested_attributes_for :mediafiles
  #has_many :digitalfiles, :dependent => :destroy
  #accepts_nested_attributes_for :digitalfiles
  	
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :photo
  
  has_attached_file :photo,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>" }
  
  # Validating the presence of the username attribute
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_format_of :name, :with => /\A[A-Za-z0-9_]+\z/
  validates_length_of :name, :maximum => 32
  
  # Creates a way for me to put username into the user route instead of just the id
 # def to_param
 # 	name
 # end
  
  def strip_and_downcase_name
    if name.present?
      name.strip!
      name.downcase!
    end
  end
  
end
