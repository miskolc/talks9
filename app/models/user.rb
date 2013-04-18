class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessible :name, :email, :password, :password_confirmation, :admin, :url
  
  
  validates_presence_of :email
  
  has_many :comments
  has_many :projects
  
  def admin?
    admin || false
  end
end
