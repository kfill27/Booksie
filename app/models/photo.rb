class Photo < ActiveRecord::Base
  belongs_to :booksie_page
  mount_uploader :image, ImageUploader
end

