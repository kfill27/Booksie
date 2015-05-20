class BooksiePage < ActiveRecord::Base

  has_many :abilities
  has_many :users, through: :abilities
  
end