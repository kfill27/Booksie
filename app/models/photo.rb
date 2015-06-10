class Photo < ActiveRecord::Base
  belongs_to :booksie_page
  has_many :comments, :as => :commentable
  mount_uploader :image, ImageUploader
  acts_as_taggable
  validates :image, presence: true
  validates :date, presence: true
end

