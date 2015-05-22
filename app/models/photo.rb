class Photo < ActiveRecord::Base
  belongs_to :booksie_page

  has_attached_file :image, styles: {small: "100x100", med: "200x200", large: "300x300"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
