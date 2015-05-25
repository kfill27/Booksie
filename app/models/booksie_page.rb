class BooksiePage < ActiveRecord::Base
  has_many :abilities, dependent: :destroy
  has_many :users, through: :abilities
  has_many :photos, dependent: :destroy
end
