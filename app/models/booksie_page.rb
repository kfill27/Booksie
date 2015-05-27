class BooksiePage < ActiveRecord::Base
  #before_create :
  has_many :abilities, dependent: :destroy
  has_many :users, through: :abilities
  has_many :photos, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :milestones, dependent: :destroy
end

