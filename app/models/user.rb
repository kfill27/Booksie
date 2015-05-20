class User < ActiveRecord::Base
  # attr_accessible :roles
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :child_users
  has_many :children, through: :child_users

end
