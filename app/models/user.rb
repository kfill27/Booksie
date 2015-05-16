class User < ActiveRecord::Base
  has_many :child_users
  has_many :children, through: :child_users

  has_many :group_users
  has_many :groups, through: :group_users
end
