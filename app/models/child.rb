class Child < ActiveRecord::Base
  has_many :child_users
  has_many :users, through: :child_users
end
