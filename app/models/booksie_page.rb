class BooksiePage < ActiveRecord::Base
  has_many :abilities, dependent: :destroy
  has_many :users, through: :abilities
<<<<<<< HEAD
  has_many :photos, dependent: :destroy
=======
  has_many :photos
  has_many :videos
>>>>>>> video_uploads
end
